extends ProgressBar

enum VALUE { NULL, HEALTH, HUNGER, OXYGEN }

@export var value_type:VALUE = VALUE.NULL
@onready var player = %Player

func _process(_delta):
	match value_type:
		VALUE.NULL:
			value = 0
		_:
			value_type = VALUE.NULL
			value = 0
		VALUE.HEALTH:
			value = player.health
		VALUE.HUNGER:
			value = player.hunger
