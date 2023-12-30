extends CharacterState

func _tick():
	host.apply_forces()
	
func _frame_2():
	host.apply_force(-8 * host.get_facing_int(), 0)
	
func _frame_11():
	host.apply_force(25 * host.get_facing_int(), 0)

func _frame_15():
	host.apply_force(-10 * host.get_facing_int(), 0)
