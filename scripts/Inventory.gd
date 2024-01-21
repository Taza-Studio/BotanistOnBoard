class_name Inventory

const SLOTS = 10

#region Key Items
var key_item_journal:bool = true
#endregion

var items = []

func _init():
	pass

func add_item(item:ItemSlot):
	if (items.size() <= SLOTS):
		items.append(item)
	else:
		# TODO: GAME_INVENTORY_YOU_CANNOT_CARRY_ANY_MORE
		pass
