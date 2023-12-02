extends CharacterState

class_name VampireState

onready var hitbox = $Hitbox

func _on_hit_something(obj, hitbox):
	._on_hit_something(obj, hitbox)
	if host.combo_count > 0 and host.hp < host.MAX_HEALTH:
		if host.hp + floor(hitbox.damage/10) >= host.MAX_HEALTH:
			host.hp = host.MAX_HEALTH
		else:
			host.hp = host.hp + floor(hitbox.damage/10)
