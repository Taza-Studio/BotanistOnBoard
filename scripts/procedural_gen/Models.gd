class_name Models
# Returns Basic Mushroom Model (no transform tuning yet)
static func mushroom(shroom:Mushroom) -> MeshInstance3D:
	var cap = MeshInstance3D.new()
	var stem = MeshInstance3D.new()
	var stem_file_location = "res://models/procedural_gen/fungi/mushroom/stem%s.obj"
	stem.mesh = load(stem_file_location % shroom.stem_type)
	stem.set_surface_override_material(0,load("res://materials/%s.tres" % shroom.stem_color))
	var cap_file_location = "res://models/procedural_gen/fungi/mushroom/cap%s%s.obj"
	var cap_s = "s" if (shroom.spotted) else "n"
	cap.mesh = load(cap_file_location % [shroom.cap_type, cap_s])
	cap.set_surface_override_material(0,load("res://materials/%s.tres" % shroom.cap_color))
	if shroom.spotted:
		cap.set_surface_override_material(2,load("res://materials/%s.tres" % shroom.cap_color_aux))
	cap.position.y = 0.2
	stem.add_child(cap)
	return stem
