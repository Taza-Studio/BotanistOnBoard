extends AudioStreamPlayer

func _process(delta):
	if %NormalMusic.building_music == true and volume_db < 0:
		volume_db += 100 * delta
	if %NormalMusic.building_music == false and volume_db > -80:
		volume_db -= 8 * delta
