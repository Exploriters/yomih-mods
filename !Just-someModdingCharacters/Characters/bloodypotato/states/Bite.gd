extends VampireState

const BLOOD_PARTICLE_SCENE = preload("res://!Just-someModdingCharacters/Characters/bloodypotato/particles/BloodEffect.tscn")
var pos = particle_position

func _on_hit_something(obj, hitbox):
	._on_hit_something(obj, hitbox)
	pos.x *= host.get_facing_int()
	spawn_particle_relative(BLOOD_PARTICLE_SCENE, pos)
