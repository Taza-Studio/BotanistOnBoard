class_name ItemSlot

var item:Resource 
var count:int
var name:String
var icon:Texture2D

func _init(item:Resource,count:int,name:String,icon:Texture2D):
	self.item = item
	self.count = count
	self.name = name
	self.icon = icon
