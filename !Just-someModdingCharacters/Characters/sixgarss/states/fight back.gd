extends CharacterState



func _tick():
	host.apply_forces()
	
	
	
func _frame_3():
	host.apply_force(-4, 0)
	
func _frame_8():
	host.apply_force(15, 0)
