class_name Health_Component
extends Node2D

@export var Max_HP : float
var HP:float 

func  _ready() -> void:
	HP = Max_HP
 
func damage(damage:float):
	HP -= damage
	print(HP)
	if HP == 0 : 
		get_parent().queue_free()
