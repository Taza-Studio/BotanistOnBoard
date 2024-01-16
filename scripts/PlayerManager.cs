using Godot;
using System;

public partial class PlayerManager : Node3D
{
	private float _hunger;
	public float Hunger 
	{
		get 
		{
			return _hunger;
		}
		set 
		{
			if (value <= 100f && value >= 0f) 
			{
				_hunger = value;
			} else 
			{
				throw new ArgumentOutOfRangeException("Hunger must be between 100 and 0.");
			}
		}
	}
	
	private float _health;
	public float Health 
	{
		get 
		{
			return _health;
		}
		set 
		{
			if (value <= 100f && value >= 0f) 
			{
				_health = value;
			} else 
			{
				throw new ArgumentOutOfRangeException("Health must be between 100 and 0.");
			}
		}
	}
	
	
	public override void _Ready()
	{
		AddChild(Mushroom.CreateMushroomModel(true, 0, 0, new ColorType(0), new ColorType(0), new ColorType(0), new ColorType(0), new Texture()));
	}

	public override void _Process(double delta)
	{
		
	}
}
