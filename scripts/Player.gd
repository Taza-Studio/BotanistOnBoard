extends CharacterBody3D

#region Constants
const SPEED = 5.0
const SPRINT_MULTIPLIER = 1.3
const JUMP_VELOCITY = 4.5
const SENSITIVITY_MULTIPLIER = 0.01
const GRAVITY = 9.8
const BOBBING_FREQUENCY = 2.0
const BOBBING_AMPLITUDE = 0.05
#endregion

#region Variables
#Options - to be replaced by a dediated options script
@export var mouse_sensitivity = 1 # TODO: Move to an options/settings file
@export var bobbing_activated = true # TODO: Move to an options/settings file

var hunger = 100.0
var health = 100.0

# Inventory
var inventory:Inventory = Inventory.new()

# Camera Bob
var t_bob = 0.0

@onready var head = $Head
@onready var cam = $Head/Camera3D
#endregion

func _ready():
	inventory.add_item(ItemSlot.new(load("res://scenes/items/magnifying_glass.tscn").instantiate(),1,"ITEM_MAGNIFYING_GLASS",load("res://textures/test_image.png")))

func _process(_delta):
	inventory.update()

func _unhandled_input(event):
	if event is InputEventMouseMotion:
		head.rotate_y(-event.relative.x * SENSITIVITY_MULTIPLIER * mouse_sensitivity)
		cam.rotate_x(-event.relative.y * SENSITIVITY_MULTIPLIER * mouse_sensitivity)
		cam.rotation.x = clamp(cam.rotation.x, deg_to_rad(-80), deg_to_rad(80))

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= GRAVITY * delta

	# Handle jump.
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	# Handle crouch.
	if Input.is_action_pressed("crouch"):
		head.position.y = 1
	else:
		head.position.y = 1.838

	# Get the input direction and handle the movement/deceleration.
	var input_dir = Input.get_vector("walk_left", "walk_right", "walk_forward", "walk_backward")
	var direction = (head.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	var speed = SPEED
	if Input.is_action_pressed("sprint"):
		speed *= SPRINT_MULTIPLIER
	if is_on_floor():
		if direction:
			velocity.x = direction.x * speed
			velocity.z = direction.z * speed
		else:
			velocity.x = move_toward(velocity.x, 0, speed)
			velocity.z = move_toward(velocity.z, 0, speed)
	else:
		velocity.x = lerp(velocity.x, direction.x * speed, delta * 3.0)
		velocity.z = lerp(velocity.z, direction.z * speed, delta * 3.0)
		
	# Head bobbing
	t_bob += delta * velocity.length() * float(is_on_floor())
	if not bobbing_activated:
		t_bob = 0.0
	cam.transform.origin = headbob(t_bob)

	move_and_slide()
	
func headbob(t) -> Vector3:
	var pos = Vector3.ZERO
	pos.y = sin(t * BOBBING_FREQUENCY) * BOBBING_AMPLITUDE
	pos.x = cos(t * BOBBING_FREQUENCY / 2) * BOBBING_AMPLITUDE / 2
	return pos
