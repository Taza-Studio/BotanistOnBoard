extends AudioStreamPlayer
var combat_music = false
var building_music = false

func _process(delta):
	if combat_music == true and volume_db > -80:
		volume_db -= 8 * delta
	if building_music == true and volume_db > -80:
		volume_db -= 8 * delta
	if building_music == false and combat_music == false and volume_db < 0:
		volume_db += 100 * delta

func _on_combat_mus_area_body_entered(_body):
	combat_music = true

func _on_building_mus_area_body_entered(_body):
	building_music = true

func _on_combat_mus_area_body_exited(_body):
	combat_music = false

func _on_building_mus_area_body_exited(_body):
	building_music = false
