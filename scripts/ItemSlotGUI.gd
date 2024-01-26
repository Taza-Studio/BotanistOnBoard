extends TextureRect

@export var slotID:int = 0
@onready var inventory = %Player.inventory

func _process(_delta):
	if (inventory.get_slot(slotID) == null):
		texture = preload("res://textures/invisible.png")
	else:
		texture = inventory.get_slot(slotID).icon

func _input(event):
	if event is InputEventMouseButton and event.pressed and not event.is_echo() and event.is_action("ui_click", true):
		if get_rect().has_point(event.position):
			print('test')
		
