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

@onready var head = $Head
@onready var cam = $Head/MainCamera


# Inventory
var inventory:Inventory = Inventory.new()
var item = null
@onready var hand = $Head/MainCamera/Hand
const hand_children_count = 1

# Camera Bob
var t_bob = 0.0

#endregion

func _ready():
	inventory.item0  = ItemSlot.new(load("res://scenes/items/magnifying_glass.tscn"),1,"ITEM_MAGNIFYING_GLASS",load("res://textures/test_image.png"))
	inventory.item1  = ItemSlot.new(load("res://scenes/items/knife.tscn"),1,"ITEM_KNIFE",load("res://textures/test_image2.png"))
	pass

func _process(_delta):
	#region Inventory
	if Input.is_action_pressed("inventory_1"):
		inventory.selected = 0
	elif Input.is_action_pressed("inventory_2"):
		inventory.selected = 1
	elif Input.is_action_pressed("inventory_3"):
		inventory.selected = 2
	elif Input.is_action_pressed("inventory_4"):
		inventory.selected = 3
	elif Input.is_action_pressed("inventory_5"):
		inventory.selected = 4
	elif Input.is_action_pressed("inventory_6"):
		inventory.selected = 5
	elif Input.is_action_pressed("inventory_7"):
		inventory.selected = 6
	elif Input.is_action_pressed("inventory_8"):
		inventory.selected = 7
	elif Input.is_action_pressed("inventory_9"):
		inventory.selected = 8
	elif Input.is_action_pressed("inventory_10"):
		inventory.selected = 9
		
	if (item != inventory.get_selected_slot()):
		
		if (hand.get_child_count() != hand_children_count):
			hand.get_child(hand_children_count).play("undraw")
			hand.get_child(hand_children_count).set_process_input(false)
			await get_tree().create_timer(0.25).timeout # Waits 0.25 seconds
			if (hand.get_child_count() != hand_children_count): # Second check is necessary because the item may have been freed during the wait.
				hand.get_child(hand_children_count).queue_free()
		item = inventory.get_selected_slot()
		if (item != null):
			hand.get_child(0).current_animation = "[stop]"
			var new_item = item.item.instantiate()
			new_item.visible = false
			new_item.set_process_input(false)
			hand.add_child(new_item)
			hand.position.y = -1.3
			
	#endregion

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
	t_bob += delta * velocity.length() * (1 - float(is_on_wall())) * float(is_on_floor())
	if bobbing_activated:
		if (t_bob >= 2 * PI):
			t_bob -= 2*PI
	else:
		t_bob = 0.0
	cam.transform.origin = headbob(t_bob)

	move_and_slide()
	
func headbob(t) -> Vector3:
	var pos = Vector3.ZERO
	pos.y = sin(t * BOBBING_FREQUENCY) * BOBBING_AMPLITUDE
	pos.x = cos(t * BOBBING_FREQUENCY / 2) * BOBBING_AMPLITUDE / 2
	return pos
