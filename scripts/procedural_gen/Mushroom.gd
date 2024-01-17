extends "Fungi.gd"

# Bitflags for the model specifications
# Allows for 32 different variations
export(int, FLAGS, "Spotted", "StemTypeBitA", "StepTypeBitB", "CapTypeBitA", "CapTypeBitB") var model_specs
# Enums for the three colors
export(int, "BLACK", "WHITE", "SILVER", "PINK", "RED", "CRIMSON", "ORANGE", "BROWN", "YELLOW", "MUSTARD", "CHARTREUSE", "GREEN", "LIME", "CYAN", "LIGHT_BLUE", "DARK_BLUE", "VIOLET", "FUCHSIA") var stem_color
export(int, "BLACK", "WHITE", "SILVER", "PINK", "RED", "CRIMSON", "ORANGE", "BROWN", "YELLOW", "MUSTARD", "CHARTREUSE", "GREEN", "LIME", "CYAN", "LIGHT_BLUE", "DARK_BLUE", "VIOLET", "FUCHSIA") var cap_color
export(int, "BLACK", "WHITE", "SILVER", "PINK", "RED", "CRIMSON", "ORANGE", "BROWN", "YELLOW", "MUSTARD", "CHARTREUSE", "GREEN", "LIME", "CYAN", "LIGHT_BLUE", "DARK_BLUE", "VIOLET", "FUCHSIA") var cap_color_aux

func get_model():
    var ret = MeshInstance3D.new()
    var stem_file_location = "res://models/procedural_gen/stem%s.obj"
    #ret.mesh = load(stem_file_location % )

    return ret

# TODO: Spore Print Generation




