extends "res://characters/states/Jump.gd"

#func _enter():
#	host.isDemon = true

#func _frame_15():
#	print("why?")

func _tick():
	if current_tick >= jump_tick:
		#if "-" in force_x:
			#if host.get_facing() == "Right" and data.x != 0:
				#anim_name = "JumpBack"
			#else :
				#anim_name = sprite_animation
		#else :
			#if host.get_facing() == "Left" and data.x != 0:
				#anim_name = "JumpBack"
			#else :
				#anim_name = sprite_animation
		#if fall_anim:
			#if fixed.gt(host.get_vel().y, fall_anim_speed):
				#anim_name = "Fall"
		host.apply_grav()
		if not super_jump or fixed.gt(host.get_vel().y, "0") or current_tick > SUPER_JUMP_FORCES_END_TICK:
			host.apply_forces()
		else :
			host.apply_forces_no_limit()
	if current_tick > jump_tick:
		if host.is_grounded():
			return "Landing"
