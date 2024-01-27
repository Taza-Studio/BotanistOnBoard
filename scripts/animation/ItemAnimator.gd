extends Node3D

enum ANIMATION_SET { DEFAULT, KNIFE, MAGNIFYING_GLASS }

@export var item_animation_set:ANIMATION_SET
@onready var animation_player:AnimationPlayer = get_node("../ItemAnimationPlayer") # For some reason only God himself knows, I can't seem to access ItemAnimationPlayer with % or with a relative from Player or with a relative from self. So, get_node() it is.

func _ready():
	visible = true
	play("draw")
	await get_tree().create_timer(0.3).timeout # Waits 0.3 seconds
	set_process_input(true)

func _input(event):
	if event.is_action_pressed("use"):
		play("use")
	elif event.is_action_pressed("inspect_item"):
		play("inspect_item")

func play(anim:String):
	if animation_player.has_animation("Items.%d/%s" % [int(item_animation_set), anim]):
		animation_player.play("Items.%d/%s" % [int(item_animation_set), anim])
	elif animation_player.has_animation("Items.0/%s" % anim):
		animation_player.play("Items.0/%s" % anim)
