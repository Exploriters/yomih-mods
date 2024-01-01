extends CharacterState

func _tick():
	host.apply_forces()
	
	

	
func _frame_2():
	host.start_invulnerability()
	host.apply_force(-8 * host.get_facing_int(), 0)
	#你感觉到有奇怪的力量在此徘徊，导致这个无敌帧会引起崩溃

func _frame_11():
	host.end_invulnerablity()
	#奇怪的力量范围及其之广，这里也会崩溃
	host.apply_force(30 * host.get_facing_int(), 0)


func _frame_15():
	host.apply_force(-5 * host.get_facing_int(), 0)
