extends Node3D

@onready var escapemenu = $EscapeMenu
@onready var inventory_gui = $Inventory
@onready var player = $SubViewportContainer/SubViewport/Player

func _ready():
	hide_all()

func _process(_delta):
	#region Debug
	#	if player falls of edge, teleport them to the center of the plane
	if player.position.y < -50:
		player.position.x = 5
		player.position.y = 10
		player.position.z = 5
	#endregion
	
	#region Handle UI Inputs
	if Input.is_action_just_pressed("pause"):
		var p = not escapemenu.is_processing()
		hide_all()
		if p:
			escapemenu.set_process(true)
			escapemenu.show()
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	elif Input.is_action_just_pressed("open_inv"):
		var p = not inventory_gui.is_processing()
		hide_all()
		if p:
			inventory_gui.set_process(true)
			inventory_gui.show()
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	#endregion
	
func hide_all():
	escapemenu.set_process(false)
	escapemenu.hide()
	inventory_gui.set_process(false)
	inventory_gui.hide()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
			
func _notification(what):
	if what == NOTIFICATION_APPLICATION_FOCUS_OUT:
		hide_all()
		escapemenu.set_process(true)
		escapemenu.show()
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE) 
