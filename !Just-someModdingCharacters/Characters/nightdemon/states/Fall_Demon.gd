extends "res://characters/states/Fall.gd"

func _frame_15():
	host.isDemon = true
	host.refresh_air_movements()
