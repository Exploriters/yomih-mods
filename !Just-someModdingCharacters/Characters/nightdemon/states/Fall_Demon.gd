extends "res://characters/states/Fall.gd"

func _frame_6():
	host.turningFail = true

func _frame_10():
	host.isDemon = true	
	host.num_air_movements = 4
	host.refresh_air_movements()
	host.isLanding = false
	host.turningFail = false
