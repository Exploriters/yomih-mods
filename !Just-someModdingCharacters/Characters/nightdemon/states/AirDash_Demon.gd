extends CharacterState

const MIN_AIRDASH_HEIGHT = 10
const BACKDASH_LAG_FRAMES = 4
const Y_MODIFIER = "0.60"
const MIN_IASA = 0
const MAX_IASA = 14
const COMBO_IASA = 7
const MAX_EXTRA_LAG_FRAMES = 5
const NEUTRAL_MIN_IASA = 9

export  var dir_x = "3.0"
export  var dir_y = "-5.0"
export  var speed = "4.0"
export  var fric = "0.05"

var p
var p_color

var starting_y = 0
var startup_lag_frames = 0

func _enter():
	p = null
	p_color = host.style_extra_color_2 if (host.style_extra_color_2 and host.applied_style) else host.extra_color_2

func _frame_1():
	#p = host._spawn_particle_effect(preload("res://!Just-someModdingCharacters/Characters/nightdemon/particles/DemonDashParticle.tscn"), host.hurtbox_pos_relative_float(), Vector2(data.x, data.y))
	p = host._spawn_particle_effect(preload("res://!Just-someModdingCharacters/Characters/nightdemon/particles/DemonDashParticle.tscn"), Vector2(host.get_pos().x, host.get_pos().y), Vector2(data.x, data.y))

func _frame_0():
	var force = xy_to_dir(data.x, data.y, speed)
	var dir = xy_to_dir(data.x, data.y)
	starting_y = host.get_pos().y
	var back = false
	if host.combo_count > 0:
		starting_iasa_at = COMBO_IASA
	else :
		starting_iasa_at = Utils.int_max(fixed.round(fixed.add(fixed.mul(fixed.vec_len(dir.x, dir.y), str(MAX_IASA - MIN_IASA)), str(MIN_IASA))), NEUTRAL_MIN_IASA)
	iasa_at = starting_iasa_at
	if "-" in force.x:
		if host.get_facing() == "Right" and data.x != 0:
			anim_name = "AirDashBackward"
			back = true
		else :
			anim_name = "AirDashForward"
	else :
		if host.get_facing() == "Left" and data.x != 0:
			anim_name = "AirDashBackward"
			back = true
		else :
			anim_name = "AirDashForward"
	if back and host.combo_count <= 0:
		backdash_iasa = true
		beats_backdash = false

		host.hitlag_ticks += BACKDASH_LAG_FRAMES
		host.add_penalty(5)
	else :
		backdash_iasa = false
		beats_backdash = true


	host.apply_force(force.x, fixed.mul(force.y, Y_MODIFIER) if "-" in force.y else force.y)

func _tick():

	host.apply_x_fric(fric)
	host.apply_forces_no_limit()
	if host.get_pos().y > -15:
		#print("LOOK OUT! YOU'RE GOING TO FALL!")
		host.set_pos(host.get_pos().x, -15)
	if host.is_grounded():
		host.isDemon = false
		if host.combo_count > 0:
			pass
		else :
			var vel = host.get_vel()
			if host.get_opponent_dir() != fixed.sign(vel.x):
				host.set_vel(fixed.mul(vel.x, "0.6"), vel.y)
	
	if p:
		if is_instance_valid(p):
			p.modulate = p_color

	var pos = host.get_pos()


