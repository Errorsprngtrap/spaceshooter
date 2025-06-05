class_name Beam
extends Area2D

const SPD:float = 600.0
var direction:int = 0
enum Owner {
	PLAYER,
	ENEMY
}

enum DMGType {
	Normal,
	PowerFull,
	Persistent
}

@export var type: Owner = Owner.PLAYER
@export var dmg: DMGType = DMGType.Normal

func _ready() -> void:
	connect("area_entered",touched)
	connect("body_entered",touched)
	
func _physics_process(delta: float) -> void:
	if type == Owner.PLAYER:
		direction = -1
	else:
		direction = 1 
	
	position.y += SPD * direction * delta
	
func touched(body: Node2D) -> void:
	if (type == Owner.PLAYER and body is Player) or (type == Owner.ENEMY and body.is_in_group("ennemy")) : 
		return
	if body.has_method("damage"):
		match dmg:
			DMGType.Normal:
				body.damage(1)
			DMGType.PowerFull:
				body.damage(2)
			DMGType.Persistent:
				body.damage(1)
		if dmg != DMGType.Persistent:
			queue_free()
			
