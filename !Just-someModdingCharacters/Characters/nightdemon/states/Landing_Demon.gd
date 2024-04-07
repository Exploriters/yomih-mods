extends "res://characters/states/Landing.gd"
var p
var p_color

func _enter():
	host.isDemon = false
	if host.turningFail == false:
		p = host._spawn_particle_effect(preload("res://fx/LandingParticle.tscn"), Vector2(host.get_pos().x,host.get_pos().y))
	else:
		p = host._spawn_particle_effect(preload("res://!Just-someModdingCharacters/Characters/nightdemon/particles/DemonLanding.tscn"), Vector2(host.get_pos().x,host.get_pos().y))
	p_color = host.style_extra_color_2 if (host.style_extra_color_2 and host.applied_style) else host.extra_color_2
	
func _tick():
	if current_tick > 4:
		host.apply_fric()
	host.apply_forces()
	
	if p:
		if is_instance_valid(p) and host.turningFail == true:
			p.modulate = p_color
			
func _exit():
	host.isLanding = false
	host.turningFail = false
