extends CharacterState

const BLOOD_PARTICLE_SCENE = preload("res://!Just-someModdingCharacters/Characters/bloodypotato/particles/BloodEffect.tscn")
onready var DontjumpLabel = $DontjumpLabel
var dontjump = true

func _frame_0():
	anim_name = "Landing"
	
func _frame_3():
	host.apply_force(0, -50)
	dontjump = false
	
func _frame_5():
	host.apply_force_relative(0, -2)
	host.apply_forces_no_limit()
	var pos = particle_position
	spawn_particle_relative(BLOOD_PARTICLE_SCENE, pos)

func _frame_13():
	host.apply_force_relative(0, 9999)
	host.apply_forces_no_limit()
	var dir
	var camera = host.get_camera()
	var screenshake_amount = 12
	dir = host.obj_local_center(host.opponent)
	dir = fixed.normalized_vec(str(dir.x), str(dir.y))
	if camera:
		camera.bump(Vector2(float(dir.x), float(dir.y)), screenshake_amount, 1)

func _frame_14():
	host.hp = 0
	host.opponent.update_facing()
	host.opponent.apply_force(0, -5)
	host.opponent.hp = 0

func _tick():
	host.apply_forces()
	if dontjump == true:
			DontjumpLabel.show()
	else:
		DontjumpLabel.hide()
