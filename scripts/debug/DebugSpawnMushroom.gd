extends Node3D

func _init():
	var spotted = ((randi() % 2) == 1)
	var cap_type = randi() % 3
	var stem_type = randi() % 3
	var stem_color = randi() % 19
	var cap_color = randi() % 19
	var cap_color_aux = randi() % 19
	var mushroom_reference = Mushroom.new(spotted,cap_type,stem_type,stem_color,cap_color,cap_color_aux,0.0,1)
	var mesh:MeshInstance3D = Models.mushroom(mushroom_reference)
	add_child(mesh)

