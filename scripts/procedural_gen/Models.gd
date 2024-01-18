var Utils = preload("res://scripts/Utils.gd")
var Mushroom = preload("res://scripts/procedural_gen/Mushroom.gd")

# Returns Basic Mushroom Model (no transform tuning yet)
func mushroom(shroom:Mushroom) -> MeshInstance3D:
    var cap = MeshInstance3D.new()
    var stem = MeshInstance3D.new()
    var stem_file_location = "res://models/procedural_gen/stem%d.obj"
    stem.mesh = load(stem_file_location % ((model_specs << 1) % 4))
    stem.set_surface_material_override(0,load("res://materials/%d.tres" % stem_color))
    var cap_file_location = "res://models/procedural_gen/cap%d%s.obj"
    var cap_s = "s" if (model_specs % 2 == 1) else "n"
    cpa.mesh = load(stem_file_location % [((model_specs << 3) % 4), cap_s])
    cap.set_surface_material_override(0,load("res://materials/%d.tres" % cap_color))
    cap.set_surface_material_override(1,load("res://materials/%d.tres" % cap_color_aux))
    cap.add_child(stem)
    return cap