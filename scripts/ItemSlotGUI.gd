extends TextureRect

@export var slotID:int = 0
@onready var inventory = %Player.inventory

func _process(_delta):
	if (inventory.get_slot(slotID) == null):
		texture = preload("res://textures/invisible.png")
	else:
		texture = inventory.get_slot(slotID).icon
