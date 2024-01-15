extends AudioStreamPlayer
var combat_music = false
var building_music = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if combat_music == true and volume_db > -80:
		volume_db -= 8 * delta
	if building_music == true and volume_db > -80:
		volume_db -= 8 * delta
	if building_music == false and combat_music == false and volume_db < 0:
		volume_db += 100 * delta


func _on_combat_mus_area_body_entered(body):
	combat_music = true

func _on_building_mus_area_body_entered(body):
	building_music = true

func _on_combat_mus_area_body_exited(body):
	combat_music = false

func _on_building_mus_area_body_exited(body):
	building_music = false
