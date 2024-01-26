extends TextureRect

@export var slotID:int = 0
@onready var inventory = %Player.inventory
@onready var old_slot = inventory.get_slot(slotID)

func _ready():
	update()

func _process(_delta):
	if not (inventory.get_slot(slotID) == old_slot):
		old_slot = inventory.get_slot(slotID)
		update()
		
func update():
	if (inventory.get_slot(slotID) == null):
		texture = load("res://textures/slot%d.png" % (slotID + 1))
		mouse_default_cursor_shape = Control.CURSOR_ARROW
	else:
		texture = inventory.get_slot(slotID).icon
		mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND

func _input(event):
	if event is InputEventMouseButton and event.pressed and not event.is_echo() and event.is_action("ui_click", true):
		if get_global_rect().has_point(event.position):
			swap()
			
func swap():
	if inventory.selected_for_swap == -1:
		if not (old_slot == null):
			inventory.selected_for_swap = slotID
	elif inventory.selected_for_swap == slotID:
		inventory.selected_for_swap = -1
	else:
		inventory.swap(slotID)
		
