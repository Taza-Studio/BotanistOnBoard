extends TextureRect

@export var slotID:int = 0
@onready var inventory = %Player.inventory

func _process(_delta):
	if (inventory.get_slot(slotID) == null):
		texture = preload("res://textures/test_image2.png")
	else:
		texture = inventory.get_slot(slotID).icon

func _input(event):
	if event is InputEventMouseButton and event.pressed and not event.is_echo() and event.is_action("ui_click", true):
		if get_global_rect().has_point(event.position):
			print(event.position)
			swap()
			
func swap():
	if inventory.selected_for_swap == -1:
		inventory.selected_for_swap = slotID
	elif inventory.selected_for_swap == slotID:
		inventory.selected_for_swap = -1
	else:
		inventory.swap(slotID)
		
