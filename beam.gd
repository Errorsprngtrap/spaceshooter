class_name beam
extends Node2D



func _on_hitbox_area_entered(area: Area2D) -> void:
	if area is HitboxComponent : 
		var hitbox : HitboxComponent = area
		hitbox.damage(1)
