using Godot;
using System;

public class ColorType
{
	private ColorTypeEnum _color;
	
	public string GetColorType(ColorTypeEnum en) 
	{
		switch (en) {
			case ColorTypeEnum.BLACK:
				return "ACCESSIBILITY_COLOR_BLACK";
			case ColorTypeEnum.WHITE:
				return "ACCESSIBILITY_COLOR_WHITE";
			case ColorTypeEnum.SILVER:
				return "ACCESSIBILITY_COLOR_SILVER";
			case ColorTypeEnum.PINK:
				return "ACCESSIBILITY_COLOR_PINK";
			case ColorTypeEnum.RED:
				return "ACCESSIBILITY_COLOR_RED";
			case ColorTypeEnum.CRIMSON:
				return "ACCESSIBILITY_COLOR_CRIMSON";
			case ColorTypeEnum.ORANGE:
				return "ACCESSIBILITY_COLOR_ORANGE";
			case ColorTypeEnum.BROWN:
				return "ACCESSIBILITY_COLOR_BROWN";
			case ColorTypeEnum.YELLOW:
				return "ACCESSIBILITY_COLOR_YELLOW";
			case ColorTypeEnum.MUSTARD:
				return "ACCESSIBILITY_COLOR_MUSTARD";
			case ColorTypeEnum.CHARTREUSE:
				return "ACCESSIBILITY_COLOR_CHARTREUSE";
			case ColorTypeEnum.GREEN:
				return "ACCESSIBILITY_COLOR_GREEN";
			case ColorTypeEnum.LIME:
				return "ACCESSIBILITY_COLOR_LIME";
			case ColorTypeEnum.CYAN:
				return "ACCESSIBILITY_COLOR_CYAN";
			case ColorTypeEnum.LIGHT_BLUE:
				return "ACCESSIBILITY_COLOR_LIGHT_BLUE";
			case ColorTypeEnum.DARK_BLUE:
				return "ACCESSIBILITY_COLOR_DARK_BLUE";
			case ColorTypeEnum.VIOLET:
				return "ACCESSIBILITY_COLOR_VIOLET";
			case ColorTypeEnum.FUCHSIA:
				return "ACCESSIBILITY_COLOR_FUCHSIA";
			default:
				return "null";
		}
	}
	
	public string GetColorType() => GetColorType(_color);
	
	public int GetColorTypeInt() => (int)_color;
	
	public ColorType(int en) => _color = (ColorTypeEnum)en;
	
	public ColorType(ColorTypeEnum en) => _color = en; 
}

public enum ColorTypeEnum 
{
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
