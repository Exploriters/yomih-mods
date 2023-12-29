extends ThrowState

var successLevel = 0

var initGuardBreak = false
var initDamage = 0
var damage_multi = 0.0

func _enter():
	released = false
	initDamage = damage
	host.rollDice()
	damage_multi = 0.0  + host.currentDicePoint * 0.1
	damage = ceil(damage * damage_multi)
	if host.currentDicePoint == 1:
		successLevel = -1 
	if host.currentDicePoint == 20:
		successLevel = 1
	
func _release():
	throw = false
	if use_release_throw_pos:
		host.throw_pos_x = release_throw_pos_x
		host.throw_pos_y = release_throw_pos_y
	else :
		update_throw_position()
	var pos = host.get_global_throw_pos()
	host.opponent.set_pos(pos.x, pos.y)
	host.opponent.update_facing()
	var throw_data = HitboxData.new(self)
	throw_data.damage = damage
	if successLevel == -1:
		throw_data.damage = ceil(damage * 0.5)
		throw_data.dir_x = -5.0
		throw_data.knockback = 2.0
		throw_data.hitstun_ticks = 45
		$"%ShockingEffectFail".start_emitting()
		host.hit_by(throw_data)
	else:
		damage_multi = 2.0
		hitstun_ticks = 45
		throw_data.dir_x = 1.0
		throw_data.knockback = 1.0
		throw_data.hitstun_ticks = 30
		host.opponent.hit_by(throw_data)
	throw_data.damage = initDamage

	if screenshake_amount > 0 and screenshake_frames > 0 and not host.is_ghost:
		var camera = get_tree().get_nodes_in_group("Camera")[0]
		camera.bump(Vector2(), screenshake_amount, screenshake_frames / 60.0)
	if release_sfx and not ReplayManager.resimulating:
		release_sfx_player.play()
	if play_release_sfx_bass:
		host.play_sound("HitBass")
	
func _frame_9():
	host.ShockingGraspColddown = 60
	host.canUseShockingGrasp = false
	if successLevel != -1:
		$"%ShockingEffect".start_emitting()
	
func _exit():
	released = false
	damage = initDamage
	successLevel = 0

func is_usable():
	return .is_usable() and host.canUseShockingGrasp
