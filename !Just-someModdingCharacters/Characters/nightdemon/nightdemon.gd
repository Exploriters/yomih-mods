extends Fighter

var isDemon = false
var isLanding = false
var turningFail = false

#Copy from robot XD
var flame_touching_opponent = null

var FireLimit = 1
var FireLeft = 1

func init(pos = null):
	.init(pos)
	FireLeft = FireLimit

func tick():
	if isDemon == false:
		num_air_movements = 0
	else:
		if isDemon == true and not is_in_hurt_state():
			num_air_movements = 4
			if get_pos().y > -15:
				set_pos(get_pos().x, -15)
				reset_momentum()
	if FireLeft < FireLimit:
		FireLeft += 0.001
		if FireLeft > FireLimit:
			FireLeft = FireLimit
	.tick()
