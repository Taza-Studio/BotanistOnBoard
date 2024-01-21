class_name Inventory

const SLOTS = 10

#region Key Items
var key_item_journal:bool = true
#endregion

var items = []
var old_selected:int = 0
var selected:int = 0
var changed:bool = false

func _init():
	changed = true

func add_slot(item:ItemSlot):
	changed = true
	if (items.size() <= SLOTS):
		items.append(item)
	else:
		# TODO: GAME_INVENTORY_YOU_CANNOT_CARRY_ANY_MORE
		pass

func remove_slot(item):
	changed = true
	if (typeof(item) == TYPE_OBJECT):
		items.erase(item)
	elif (typeof(item) == TYPE_INT):
		items.remove_at(item)
		
# TODO: func add/remove_item(item:String):

func get_selected_slot() -> ItemSlot:
	return items[selected]
	
func update():
	if (old_selected != selected):
		changed = true
	old_selected = selected
	pass
