extends Node3D

@onready var escapemenu = $EscapeMenu
@onready var inventory_gui = $Inventory

func _ready():
	escapemenu.hide()
	escapemenu.set_process(false)
	inventory_gui.hide()
	inventory_gui.set_process(false)
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _process(_delta):
	if get_node("SubViewportContainer/SubViewport/Player").position.y < -50:
		get_node("SubViewportContainer/SubViewport/Player").position.y = 10
		get_node("SubViewportContainer/SubViewport/Player").position.x = 5
		get_node("SubViewportContainer/SubViewport/Player").position.z = 5
	if Input.is_action_just_pressed("pause"):
		if escapemenu.is_visible():
			escapemenu.set_process(false)
			escapemenu.hide()
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		else:
			escapemenu.set_process(true)
			escapemenu.show()
			inventory_gui.set_process(false)
			inventory_gui.hide()
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	elif Input.is_action_just_pressed("open_inv"):
		if inventory_gui.is_visible():
			inventory_gui.set_process(false)
			inventory_gui.hide()
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		else:
			inventory_gui.set_process(true)
			inventory_gui.show()
			escapemenu.set_process(false)
			escapemenu.hide()
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
func _notification(what):
	if what == NOTIFICATION_APPLICATION_FOCUS_OUT:
		escapemenu.set_process(true)
		escapemenu.show()
		inventory_gui.set_process(false)
		inventory_gui.hide()
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE) 
