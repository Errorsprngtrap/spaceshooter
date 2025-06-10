class_name HitboxComponent
extends Area2D

@export var HP_Component : Health_Component

func damage(damage:float):
	if HP_Component:
		HP_Component.damage(damage)
