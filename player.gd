class_name player
extends CharacterBody2D

@export var speed : float 
var dir : float

func _physics_process(delta: float) -> void:
	dir = Input.get_axis("left","right")
	position.x += speed * dir * delta
