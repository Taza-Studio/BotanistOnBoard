extends Node3D
var Mushroom = preload("res://scripts/procedural_gen/Mushroom.gd")
var Models = preload("res://scripts/procedural_gen/Models.gd")

# Bitflags for the model specifications
# Allows for 32 different variations
export(int, FLAGS, "Spotted", "StemTypeBitA", "StepTypeBitB", "CapTypeBitA", "CapTypeBitB") var model_specs
# Enums for the three colors
export(int, "BLACK", "WHITE", "SILVER", "PINK", "RED", "CRIMSON", "ORANGE", "BROWN", "YELLOW", "MUSTARD", "CHARTREUSE", "GREEN", "LIME", "CYAN", "LIGHT_BLUE", "DARK_BLUE", "VIOLET", "FUCHSIA") var stem_color
export(int, "BLACK", "WHITE", "SILVER", "PINK", "RED", "CRIMSON", "ORANGE", "BROWN", "YELLOW", "MUSTARD", "CHARTREUSE", "GREEN", "LIME", "CYAN", "LIGHT_BLUE", "DARK_BLUE", "VIOLET", "FUCHSIA") var cap_color
export(int, "BLACK", "WHITE", "SILVER", "PINK", "RED", "CRIMSON", "ORANGE", "BROWN", "YELLOW", "MUSTARD", "CHARTREUSE", "GREEN", "LIME", "CYAN", "LIGHT_BLUE", "DARK_BLUE", "VIOLET", "FUCHSIA") var cap_color_aux

func _ready():
    var mushroom_reference = Mushroom.new(model_specs,stem_color,cap_color,cap_color_aux,0.0,1)
    var mesh:MeshInstance3D = Models.mushroom(mushroom_reference)
    add_child(mesh)

