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

# Yes I know this is ugly.
func get_selected_slot() -> ItemSlot:
	match selected:
		0:
			return item0
		1:
			return item1
		2:
			return item2
		3:
			return item3
		4:
			return item4
		5:
			return item5
		6:
			return item6
		7:
			return item7
		8:
			return item8
		9:
			return item9
		_:
			selected = clamp(selected, 0, 9)
			return get_selected_slot()
	
