extends "res://characters/states/Jump.gd"

var p
var p_color

func _enter():
	p = null
	p_color = host.style_extra_color_2 if (host.style_extra_color_2 and host.applied_style) else host.extra_color_2

#func _frame_15():
#	print("why?")

func jump():
	host.end_throw_invulnerability()
	var vel = host.get_vel()
	host.set_grounded(false)
	host.set_vel(fixed.mul(vel.x, x_speed_preserved), "0")

	var force = xy_to_dir(data["x"], data["y"])
	var force_power = fixed.vec_mul(force.x, force.y, fixed.powu(fixed.vec_len(force.x, force.y), 2))
	force = Utils.fixed_vec2_string(fixed.div(fixed.add(force_power.x, force.x), "2"), fixed.div(fixed.add(force_power.y, force.y), "2"))
	force = fixed.vec_mul(force.x, force.y, fixed.add(speed, BASE_JUMP_SPEED) if not super_jump else (SUPER_JUMP_SPEED if super_jump_speed_override == "" else super_jump_speed_override))
	
	p = host._spawn_particle_effect(preload("res://!Just-someModdingCharacters/Characters/nightdemon/particles/DemonJump.tscn"), Vector2(host.get_pos().x, host.get_pos().y), Vector2(float(force.x), float(force.y)))
	#Vector2(host.get_pos().x, host.get_pos().y), Vector2(data.x, data.y)
	
	#if not super_jump:
	#	spawn_particle_relative(particle_scene, Vector2(), Vector2(float(force.x), float(force.y)))
	#else :
	#	spawn_particle_relative(preload("res://characters/stickman/StompEffect.tscn"))
	#	var camera = host.get_camera()
	#	if camera:
	#		camera.bump(Vector2.UP, 10, 20 / 60.0)
	
	
	
	force.y = fixed.mul(force.y, y_modifier)
	force.x = fixed.mul(force.x, x_modifier)
	if (host.combo_count <= 0 or host.opponent.on_the_ground) and not super_jump:
		force.y = fixed.mul(force.y, GLOBAL_JUMP_MODIFIER)
	host.apply_force(force.x, force.y)
	force_x = force.x
	force_y = force.y
	interruptible_on_opponent_turn = true
	next_state_on_hold = true
	next_state_on_hold_on_opponent_turn = true

func _tick():
	if current_tick >= jump_tick:
		if "-" in force_x:
			if host.get_facing() == "Right" and data.x != 0:
				anim_name = "JumpBack"
			else :
				anim_name = sprite_animation
		else :
			if host.get_facing() == "Left" and data.x != 0:
				anim_name = "JumpBack"
			else :
				anim_name = sprite_animation
		if fall_anim:
			if fixed.gt(host.get_vel().y, fall_anim_speed):
				anim_name = "TurnToDemon"
		host.apply_grav()
		if not super_jump or fixed.gt(host.get_vel().y, "0") or current_tick > SUPER_JUMP_FORCES_END_TICK:
			host.apply_forces()
		else :
			host.apply_forces_no_limit()
	if current_tick > jump_tick:
		if host.is_grounded():
			host.isLanding = true
			return "Landing"
			
	if p:
		if is_instance_valid(p):
			p.modulate = p_color
