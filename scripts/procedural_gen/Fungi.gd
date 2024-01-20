extends "SpeciesType.gd"
class_name Fungi
var edibility:float


func _init(edibility:float,speciesUUID:int):
	self.edibility = edibility
	self.speciesUUID = speciesUUID
