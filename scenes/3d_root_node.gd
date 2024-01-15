extends Node3D

var is_pressed = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$EscapeMenu.hide()
	$EscapeMenu.set_process(false)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("pause"):
		if is_pressed == false:
			$EscapeMenu.set_process(true)
			$EscapeMenu.show()
			is_pressed = !is_pressed
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		else:
			$EscapeMenu.set_process(false)
			$EscapeMenu.hide()
			is_pressed = !is_pressed
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

