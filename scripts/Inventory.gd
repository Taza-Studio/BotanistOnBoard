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

var selected_for_swap:int = -1

# TODO: func add/remove_item(item:String):

# Yes I know this is ugly.
func get_slot(s:int) -> ItemSlot:
	match s:
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
			return get_slot(clamp(s, 0, 9))
	
func set_slot(s:int, i:ItemSlot):
	match s:
		0:
			item0 = i
		1:
			item1 = i
		2:
			item2 = i
		3:
			item3 = i
		4:
			item4 = i
		5:
			item5 = i
		6:
			item6 = i
		7:
			item7 = i
		8:
			item8 = i
		9:
			item9 = i
		_:
			set_slot(clamp(s,0,9),i)
	
func get_selected_slot() -> ItemSlot:
	return get_slot(selected)

func swap(new_slot:int):
	var temps = get_slot(selected_for_swap)
	set_slot(selected_for_swap,get_slot(new_slot))
	set_slot(new_slot,temps)
	selected_for_swap = -1
	
