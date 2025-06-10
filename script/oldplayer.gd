class_name Player
extends CharacterBody2D

@onready var root = get_tree().current_scene
@onready var player_fire_timer: Timer = $PlayerFireTimer
@export var beam_scene: PackedScene
const spd:float = 100.0
var fire:bool = false
var hp:int = 3

func _ready() -> void:
	player_fire_timer.timeout.connect(_on_fire_timer_timeout)
	
func _physics_process(delta: float) -> void:
	var direction:float = Input.get_axis("left","right")
	position.x += spd * direction * delta
	
	if Input.is_action_just_pressed("Shoot") and fire == false :
		fire = true
		var beam_instance:Beam = beam_scene.instantiate()
		beam_instance.type = beam_instance.Owner.PLAYER
		beam_instance.global_position = global_position
		root.get_node("beam").add_child(beam_instance)
		player_fire_timer.start()
		
func _on_fire_timer_timeout():
	fire = false
	
func damage(dmg):
	hp -= dmg
	if hp <= 0:
		die()
	
func die():
	queue_free()
	
