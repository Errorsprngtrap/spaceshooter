class_name Ennemy
extends Area2D

enum Type {
	Normal,
	Shooter,
	PowerShotter,
	Dart
}

var hp_by_type = {
	Type.Normal: 3,
	Type.Shooter: 2,
	Type.PowerShotter: 1,
	Type.Dart: 1
}

var hp:int = 3
var fire:bool = false
var SPD:float = 200.0
@export var type: Type = Type.Normal
@export var beam_scene: PackedScene
@onready var ennemy_fire_timer: Timer = $Ennemy_fire_timer

func _ready() -> void:
	add_to_group("ennemy")
	ennemy_fire_timer.timeout.connect(_on_fire_timer_timeout)
	hp = hp_by_type[type]
	

func _physics_process(delta: float) -> void:
	position.y += SPD * 1 * delta

func _on_fire_timer_timeout():
	fire = false
	

func damage(dmg):
	hp -= dmg
	if hp <= 0:
		die()
	
func die():
	queue_free()


func _on_body_entered(body: Node2D) -> void:
	print("A")
	if body.has_method("damage") and body is Player:
		print("B")
		body.damage(1)
