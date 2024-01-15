using Godot;
using System;

public abstract class Fungi : SpeciesType
{
	public byte edibility;
}

public class Mushroom : Fungi 
{
	public ColorType stemColor;
	public ColorType capMainColor;
	public ColorType capAccentColor;
	
	public override Texture GetPrint() {
		// TODO: Spore Print
		return new Texture();
	}	
}

public class ShelfMushroom : Fungi 
{
	public ColorType mainColor;
	
	public override Texture GetPrint() {
		// TODO: Spore Print
		return new Texture();
	}	
}

public class Lichen : Fungi 
{
	public ColorType mainColor;
	public ColorType mossColor;
	
	public override Texture GetPrint() {
		// TODO: Lichen Print
		return new Texture();
	}	
}
