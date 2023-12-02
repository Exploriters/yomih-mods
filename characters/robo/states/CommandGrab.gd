extends RobotState

var reversing_command_grab = false

func _enter():
	reversing_command_grab = data




func _frame_1():
	host.move_directly_relative(5, 0)



