using Godot;
using System;

public abstract class Fungi : SpeciesType
{
	public byte edibility;
}

public class Mushroom : Fungi 
{
	public bool hasSpots;
	public byte stemType;
	public byte capType;
	
	public ColorType stemColor;
	public ColorType gillColor;
	public ColorType capMainColor;
	public ColorType capAccentColor;
	
	public override Texture GetPrint() 
	{
		// TODO: Spore Print
		return new Texture();

	}	
	
	public Mushroom(bool hasSpots, byte stemType, byte capType, ColorType stemColor, ColorType gillColor, ColorType capMainColor, ColorType capAccentColor) 
	{
		this.hasSpots = hasSpots;
		this.stemType = stemType;
		this.capType = capType;
		this.stemColor = stemColor;
		this.gillColor = gillColor;
		this.capMainColor = capMainColor;
		this.capAccentColor = capAccentColor;
	}
	
	public Node3D GetMushroomModel() => CreateMushroomModel(hasSpots, stemType, capType, stemColor, gillColor, capMainColor, capAccentColor, GetPrint());
	
	public static Node3D CreateMushroomModel(bool spots, byte stem, byte cap, ColorType stemC, ColorType gillC, ColorType capMainC, ColorType capAccentC, Texture sporePrint) 
	{
		Node3D encompassingNode = new Node3D();
		encompassingNode.AddChild(new MeshInstance3D());
		
		return encompassingNode;
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
