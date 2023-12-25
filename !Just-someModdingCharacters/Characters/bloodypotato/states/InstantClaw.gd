extends VampireState

const BLOOD_PARTICLE_SCENE = preload("res://!Just-someModdingCharacters/Characters/bloodypotato/particles/BloodEffect.tscn")
const SCRATCHES_SCENE = preload("res://!Just-someModdingCharacters/Characters/bloodypotato/particles/scratches.tscn")
var pos = particle_position

var tp_pos_x = 0
var tp_pos_y = 0
var st_pos_x = 0
var st_pos_y = 0
var tp_vel_x = "0"
var tp_vel_y = "0"
var dir = 1
var vec_x = 0
var vec_y = 0

func _frame_9():
	var opp_pos = host.opponent.get_pos()
	var opp_vel = host.opponent.get_vel()
	var posP = host.get_pos()
	dir = host.get_opponent_dir()
	tp_pos_x = opp_pos.x + 32 * (host.get_opponent_dir())
	tp_pos_y = opp_pos.y
	tp_vel_x = opp_vel.x
	tp_vel_y = opp_vel.y
	st_pos_x = posP.x
	st_pos_y = posP.y
	
	vec_x = tp_pos_x - st_pos_x
	vec_y = tp_pos_y - st_pos_y

	host.set_vel(tp_vel_x, tp_vel_y)
	host.set_pos(tp_pos_x, tp_pos_y)

func _frame_10():
	var angleL = atan2(vec_x , vec_y)
	if st_pos_y > tp_pos_y:
		angleL = -angleL
	host.set_pos(int(host.get_pos().x - st_pos_y * tan(angleL)) ,0)
	host.set_vel(0, 0)
	
func _on_hit_something(obj, hitbox):
	._on_hit_something(obj, hitbox)
	if host.combo_count > 0:
		pos.x *= host.get_facing_int()
		spawn_particle_relative(BLOOD_PARTICLE_SCENE, pos)
		spawn_particle_relative(SCRATCHES_SCENE, Vector2(particle_position.x + 32 * (host.get_opponent_dir()) , particle_position.y - 10), Vector2(vec_x, vec_y))
