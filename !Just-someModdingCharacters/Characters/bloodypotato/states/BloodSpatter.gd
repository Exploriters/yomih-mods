extends VampireState

const BLOOD_SCENE = preload("res://!Just-someModdingCharacters/Characters/bloodypotato/projectile/splattedBlood.tscn")
const BLOOD_PARTICLE_SCENE = preload("res://!Just-someModdingCharacters/Characters/bloodypotato/particles/BloodEffect.tscn")
onready var crit_label = $CritLabel
var pos = particle_position
var is_crit = false

func _tick():
	host.apply_forces()
	if is_crit == true:
		crit_label.show()
	else:
		crit_label.hide()

func _frame_5():
	host.apply_force(-2, 0)
	pos.x *= host.get_facing_int()
	spawn_particle_relative(BLOOD_PARTICLE_SCENE, pos)
	var crit = host.randi_range(0,99)
	if crit <= 1:
		host.hp = host.hp - 250
		is_crit = true
		var dir
		var camera = host.get_camera()
		var screenshake_amount = 12
		dir = host.obj_local_center(host.opponent)
		dir = fixed.normalized_vec(str(dir.x), str(dir.y))
		if camera:
			camera.bump(Vector2(float(dir.x), float(dir.y)), screenshake_amount, 0.25)
	else:
		host.hp = host.hp - 50
		is_crit = false
	
func _frame_14():
	host.apply_force(5, 0)
	host.spawn_object(BLOOD_SCENE, 0, -23)

func _frame_15():
	host.spawn_object(BLOOD_SCENE, 0, -26)
	
func _frame_16():
	host.spawn_object(BLOOD_SCENE, 0, -20)
	
func _frame_22():
	is_crit = false
