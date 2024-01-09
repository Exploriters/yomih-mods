extends CharacterState

const PARTICLE_SCENE = preload("res://fx/InstantCancelEffect.tscn")
var pos = particle_position

func _frame_4():
	host.OnShielding = true
	host.canUseShield = false
	host.SpellLeft -= 3
	pos.x *= host.get_facing_int()
	spawn_particle_relative(PARTICLE_SCENE, pos)
	$"%ShieldEffect".start_emitting()
	
func is_usable():
	return .is_usable() and host.canUseShield and host.SpellLeft >= 3
