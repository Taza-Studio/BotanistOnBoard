extends "Fungi.gd"
class_name Mushroom

# Bitflags for the model specifications
# Allows for 32 different variations
# Enums for the three colors
var spotted:bool
var stem_type:int
var cap_type:int
var stem_color:int
var cap_color:int
var cap_color_aux:int

func _init(spotted:bool, stem_type:int, cap_type:int, stem_color:int, cap_color:int, cap_color_aux:int, edibility:float, speciesUUID:int):
	self.spotted = spotted
	self.stem_type = stem_type
	self.cap_type = cap_type
	self.stem_color = stem_color
	self.cap_color = cap_color
	self.cap_color_aux = cap_color_aux
	self.edibility = edibility
	self.speciesUUID = speciesUUID

# TODO: Spore Print Generation




