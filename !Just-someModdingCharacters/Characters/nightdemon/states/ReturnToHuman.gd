extends CharacterState

func _frame_6():
	host.isDemon = false
	host.reset_momentum()
	host.set_pos(host.get_pos().x, 0)
