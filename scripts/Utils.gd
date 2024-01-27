class_name Utils

enum ColorType {
	BLACK,
	WHITE, 
	SILVER, 
	PINK, 
	RED, 
	CRIMSON, 
	ORANGE,
	BROWN, 
	YELLOW, 
	MUSTARD, 
	CHARTREUSE, 
	GREEN, 
	LIME, 
	CYAN, 
	LIGHT_BLUE, 
	DARK_BLUE, 
	VIOLET, 
	FUCHSIA
}

static func color_to_string(c:ColorType):
	match int(c):
		0:
			return "BLACK"
		1:
			return "WHTIE"
		2:
			return "SILVER"
		3:
			return "PINK"
		4:
			return "RED"
		5:
			return "CRIMSON"
		6:
			return "ORANGE"
		7:
			return "BROWN"
		8:
			return "YELLOW"
		9:
			return "MUSTARD"
		10:
			return "CHARTREUSE"
		11:
			return "GREEN"
		12:
			return "LIME"
		13:
			return "CYAN"
		14:
			return "LIGHT_BLUE"
		15:
			return "DARK_BLUE"
		16:
			return "VIOLET"
		17:
			return "FUCHSIA"
		_:
			return null
