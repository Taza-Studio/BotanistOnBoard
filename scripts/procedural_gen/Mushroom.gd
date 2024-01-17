extends "Fungi.gd"

# Bitflags for the model specifications
# Allows for 32 different variations
export(int, FLAGS, "Spotted", "StemTypeBitA", "StepTypeBitB", "CapTypeBitA", "CapTypeBitB") var model_specs
# Enums for the three colors
export(int, "BLACK", "WHITE", "SILVER", "PINK", "RED", "CRIMSON", "ORANGE", "BROWN", "YELLOW", "MUSTARD", "CHARTREUSE", "GREEN", "LIME", "CYAN", "LIGHT_BLUE", "DARK_BLUE", "VIOLET", "FUCHSIA") var stem_color
export(int, "BLACK", "WHITE", "SILVER", "PINK", "RED", "CRIMSON", "ORANGE", "BROWN", "YELLOW", "MUSTARD", "CHARTREUSE", "GREEN", "LIME", "CYAN", "LIGHT_BLUE", "DARK_BLUE", "VIOLET", "FUCHSIA") var cap_color
export(int, "BLACK", "WHITE", "SILVER", "PINK", "RED", "CRIMSON", "ORANGE", "BROWN", "YELLOW", "MUSTARD", "CHARTREUSE", "GREEN", "LIME", "CYAN", "LIGHT_BLUE", "DARK_BLUE", "VIOLET", "FUCHSIA") var cap_color_aux

func get_model():
    var cap = MeshInstance3D.new()
    var stem = MeshInstance3D.new()
   
    var stem_file_location = "res://models/procedural_gen/stem%d.obj"
    stem.mesh = load(stem_file_location % ((model_specs << 1) % 4))
    # stem.material_override.albedo_color = 
    var cap_file_location = "res://models/procedural_gen/cap%d%s.obj"
    var cap_s = "s" if (model_specs % 2 == 1) else "n"
    cpa.mesh = load(stem_file_location % [((model_specs << 3) % 4), cap_s])
    cap.add_child(stem)
    return cap

# TODO: Spore Print Generation



