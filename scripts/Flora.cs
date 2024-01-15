using Godot;
using System;

public abstract class Flora : SpeciesType
{

}

public class TreeSpecies : Flora
{
	
	public override Texture GetPrint() {
		// TODO: Leaf Prints
		return new Texture();
	}
}

public class GrassSpecies : Flora
{ 
	public override Texture GetPrint() {
		// TODO: Leaf Prints
		return new Texture();
	}
}

public class ShrubSpecies : Flora
{ 
	public ColorType mainColor;
	public ColorType tipColor;
	
	public byte edibility;
	
	public override Texture GetPrint() {
		// TODO: Leaf Prints
		return new Texture();
	}
}

public class FoliageSpecies : Flora
{ 
	public override Texture GetPrint() {
		// TODO: Leaf Prints
		return new Texture();
	}
}
