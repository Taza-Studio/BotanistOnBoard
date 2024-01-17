extends Node3D
var hunger = 100
var health = 100

func _process(_delta):
	hunger = clamp(hunger,0,100)
	health = clamp(health,0,100)
	
