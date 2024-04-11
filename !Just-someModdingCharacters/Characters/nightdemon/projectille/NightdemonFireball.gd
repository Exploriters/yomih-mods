extends DefaultFireball

var obj
var obj_color

func _enter():
	obj = null
	obj_color = host.creator.style_extra_color_2 if (host.creator.style_extra_color_2 and host.creator.applied_style) else host.creator.extra_color_2

func _tick():
	var pos = host.get_pos()
	host.update_grounded()
	if not hit_something and ((host.is_grounded() and fizzle_on_ground) or (fizzle_on_walls and (pos.x <= - host.stage_width or pos.x >= host.stage_width))):
		obj = host.spawn_object(preload("res://!Just-someModdingCharacters/Characters/nightdemon/projectille/NightdemonFireball_GroundFire.tscn"), 0, 0)
		fizzle()
		host.hurtbox.width = 0
		host.hurtbox.height = 0
		pass
	if current_tick >= lifetime:
		fizzle()
	elif not hit_something:
		move()
	if follow_creator:
		if host.creator:
			var creator_pos = host.creator.get_pos()
			host.set_pos(creator_pos.x, creator_pos.y)
			
	if obj:
		if is_instance_valid(obj):
			obj.modulate = obj_color
