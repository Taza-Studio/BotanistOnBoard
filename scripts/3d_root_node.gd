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
	#region Debug
	#	if player falls of edge, teleport them to the center of the plane
	if get_node("SubViewportContainer/SubViewport/Player").position.y < -50:
		get_node("SubViewportContainer/SubViewport/Player").position.y = 10
		get_node("SubViewportContainer/SubViewport/Player").position.x = 5
		get_node("SubViewportContainer/SubViewport/Player").position.z = 5
	#endregion
	
	#region Handle UI Inputs
	if Input.is_action_just_pressed("pause"):
		hide_all()
		if not escapemenu.is_visible():
			escapemenu.set_process(true)
			escapemenu.show()
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	elif Input.is_action_just_pressed("open_inv"):
		hide_all()
		if not inventory_gui.is_visible():
			inventory_gui.set_process(true)
			inventory_gui.show()
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	#endregion
	
func hide_all():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	escapemenu.set_process(false)
	escapemenu.hide()
	inventory_gui.set_process(false)
	inventory_gui.hide()
			
func _notification(what):
	if what == NOTIFICATION_APPLICATION_FOCUS_OUT:
		escapemenu.set_process(true)
		escapemenu.show()
		inventory_gui.set_process(false)
		inventory_gui.hide()
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE) 
