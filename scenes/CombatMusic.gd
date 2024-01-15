extends AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if %NormalMusic.combat_music == true and volume_db < 0:
		volume_db += 100 * delta
	if %NormalMusic.combat_music == false and volume_db > -80:
		volume_db -= 8 * delta
		
