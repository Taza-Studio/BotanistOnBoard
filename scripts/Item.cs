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
