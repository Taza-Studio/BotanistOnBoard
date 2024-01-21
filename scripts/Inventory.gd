class_name Inventory

#region Key Items
var key_item_journal:bool = true
#endregion

var item0:ItemSlot
var item1:ItemSlot
var item2:ItemSlot
var item3:ItemSlot
var item4:ItemSlot
var item5:ItemSlot
var item6:ItemSlot
var item7:ItemSlot
var item8:ItemSlot
var item9:ItemSlot
var selected:int = 0

# TODO: func add/remove_item(item:String):

func get_selected_slot() -> ItemSlot:
	return items[selected]
	
func update():
	if (old_selected != selected):
		changed = true
	old_selected = selected
	pass
