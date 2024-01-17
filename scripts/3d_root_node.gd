extends Node3D

func _ready():
	$EscapeMenu.hide()
	$EscapeMenu.set_process(false)
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _process(_delta):
	if get_node("SubViewportContainer/SubViewport/Player").position.y < -50:
		get_node("SubViewportContainer/SubViewport/Player").position.y = 10
		get_node("SubViewportContainer/SubViewport/Player").position.x = 5
		get_node("SubViewportContainer/SubViewport/Player").position.z = 5
	if Input.is_action_just_pressed("pause"):
		if get_node("EscapeMenu").is_visible():
			$EscapeMenu.set_process(false)
			$EscapeMenu.hide()
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		else:
			$EscapeMenu.set_process(true)
			$EscapeMenu.show()
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
