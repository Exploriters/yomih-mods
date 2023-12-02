extends VampireState

onready var hitbox2 = $Hitbox2

func _on_hit_something(obj, hitbox2):
	._on_hit_something(obj, hitbox2)
	if host.combo_count > 0 and host.hp < host.MAX_HEALTH:
		if host.hp + floor(hitbox.damage/10) >= host.MAX_HEALTH:
			host.hp = host.MAX_HEALTH
		else:
			host.hp = host.hp + floor(hitbox2.damage/10)
