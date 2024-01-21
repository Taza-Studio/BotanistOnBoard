class_name ItemSlot

var item:Node3D 
var count:int
var name:String
var icon:Image

func _init(item:Node3D,count:int,name:String,icon:Image):
	self.item = item
	self.count = count
	self.name = name
	self.icon = icon
