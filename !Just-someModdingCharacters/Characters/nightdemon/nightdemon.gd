extends Fighter

var isDemon = false

func tick():
	.tick()
	if isDemon == false:
		num_air_movements = 0
	else:
		if isDemon == true:
			num_air_movements = 4
