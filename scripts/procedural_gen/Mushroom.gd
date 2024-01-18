extends "Fungi.gd"
var Utils = preload("res://scripts/Utils.gd")
# Bitflags for the model specifications
# Allows for 32 different variations
export(int, FLAGS, "Spotted", "StemTypeBitA", "StepTypeBitB", "CapTypeBitA", "CapTypeBitB") var model_specs
# Enums for the three colors
var stem_color:int
var cap_color:int
var cap_color_aux:int

func _init(model_specs:int, stem_color:int, cap_color:int, cap_color_aux:int).(edibility).(speciesUUID)
    self.model_specs = model_specs
    self.stem_color = stem_color
    self.cap_color = cap_color
    self.cap_color_aux = cap_color_aux
    self.edibility = edibility
    self.speciesUUID = speciesUUID

# TODO: Spore Print Generation




