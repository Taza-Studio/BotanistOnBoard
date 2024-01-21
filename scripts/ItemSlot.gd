class_name ItemSlot

var item:Resource 
var count:int
var name:String
var icon:Texture

func _init(item:Resource,count:int,name:String,icon:Texture):
	self.item = item
	self.count = count
	self.name = name
	self.icon = icon
