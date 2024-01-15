using Godot;
using System;

public abstract class Flora : SpeciesType
{
	public abstract Texture GetLeafPrint();  
}

public class TreeSpecies : Flora
{
	
	public override Texture GetLeafPrint() {
		// TODO: Leaf Prints
		return new Texture();
	}
}

public class GrassSpecies : Flora
{ 
	public override Texture GetLeafPrint() {
		// TODO: Leaf Prints
		return new Texture();
	}
}

public class ShrubSpecies : Flora
{ 
	public ColorType mainColor;
	public ColorType tipColor;
	
	public byte shootEdibility;
	
	public override Texture GetLeafPrint() {
		// TODO: Leaf Prints
		return new Texture();
	}
}

public class FoliageSpecies : Flora
{ 
	public override Texture GetLeafPrint() {
		// TODO: Leaf Prints
		return new Texture();
	}
}
