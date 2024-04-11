extends CharacterState

var length

func _frame_6():
	host.FireLeft -= 0.1
	var dir = xy_to_dir(data.x, data.y)
	var obj = host.spawn_object(preload("res://!Just-someModdingCharacters/Characters/nightdemon/projectille/NightdemonFireball.tscn"), projectile_pos_x, projectile_pos_y, true)
	#var force = fixed.normalized_vec_times(dir.x, dir.y, str(abs(sqrt(pow(float(data.x) , 2) + pow(float(data.y), 2)))))
	var force = fixed.vec_mul(fixed.mul(dir.x, str(host.get_facing_int())), dir.y, "5")
	obj.apply_force_relative(force.x, force.y)
	var vel = host.get_vel()
	obj.apply_force(vel.x, vel.y)

func is_usable():
	return .is_usable() and host.FireLeft >= 0.1
