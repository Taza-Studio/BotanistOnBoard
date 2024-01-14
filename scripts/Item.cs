using Godot;
using System;

// Item is a Struct because it is immutable
public struct Item {
	public string name;
	public long itemID;
	
	public Item(string name, long itemID) 
	{
		this.name = name;
		this.itemID = itemID;
	}
}

// Item Slot is a class because the number of items in each slot may change
public class ItemSlot {
	public Item? item;
	private byte _itemCount;
	
	// C# field to ensure ItemCount will never go above the max
	public byte ItemCount 
	{
		get
		{
			if (item == null) {
				return 0;
			} else {
				return _itemCount;
			}
		}
		set 
		{
			// 30 is the max item count per slot
			if (value < 30 && value > 0) 
			{
				_itemCount = value;
			} else if (value == 0) {
				_itemCount = 0;
				item = null;
			} else {
				throw new ArgumentOutOfRangeException("Item Count must be between 0 and 30");
			}
		}
	};
	
	public ItemSlot(Item? item, byte itemCount) 
	{
		this.item = item;
		this.ItemCount = itemCount;
	}
}
