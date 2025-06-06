class_name Manager
extends Node

@onready var ennemy_spawn_timer: Timer = $ennemy_spawn_timer
@export var ennemy:PackedScene
@onready var root = get_tree().current_scene

func _on_ennemy_spawn_timer_timeout() -> void:
	var ennemy_scene:Ennemy = ennemy.instantiate()
	root.get_node("Ennemy_Container").add_child(ennemy_scene)
	ennemy_scene.global_position = Vector2(randf_range(30,640),100)
