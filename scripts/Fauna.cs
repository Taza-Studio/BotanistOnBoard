using Godot;
using System;

public abstract class Fauna : SpeciesType
{
	public byte hostility;
	public int[] prey;
}

public class ColonyInsect : Fauna 
{
	public override Texture GetPrint() {
		// TODO: Queen Drawing
		return new Texture();
	}
}

public abstract class OtherInsect : Fauna 
{ }

public class NonMetamorphesizingFlyingInsect : OtherInsect
{
	public override Texture GetPrint() {
		// TODO: Wing
		return new Texture();
	}
}

public class ButterflyMoth : OtherInsect
{
	public override Texture GetPrint() {
		// TODO: Wing
		return new Texture();
	}
}

public class Spider : OtherInsect
{
	public byte edibility;
	public byte venomLevel;
		
	public override Texture GetPrint() {
		// TODO: Web Pattern
		return new Texture();
	}
}

public class Fish : Fauna
{
	public ColorType scaleColor;
	
	public byte edibility;
	
	public override Texture GetPrint() {
		// TODO: Fish Scale
		return new Texture();
	}
}

public abstract class Quadraped : Fauna 
{ }

public class Mammal : Quadraped 
{
	public bool milkable;
	public byte milkEdibility;
	public byte meatEdibility;
	
	public override Texture GetPrint() {
		// TODO: Paw Print
		return new Texture();
	}
}

