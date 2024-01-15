using Godot;
using System;

public abstract class SpeciesType
{
	public int speciesUUID;
	public abstract Texture GetPrint();
}
