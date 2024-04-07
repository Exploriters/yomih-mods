extends CharacterState

export  var auto_fall = true

func _enter():
	if auto_fall:
		if not host.is_grounded() and host.isDemon == false:
			return "Fall_Demon"
	#if host.get_pos().y > -15:
	#	host.set_pos(host.get_pos().x, -15)

func _tick():
	host.apply_fric()
	host.apply_forces()
#	if host.get_pos().y > -15:
#		host.set_pos(host.get_pos().x, -15)
#		host.reset_momentum()
	if auto_fall:
		if not host.is_grounded() and host.isDemon == false:
			return "Fall_Demon"
	if host.hp <= 0:
		return "Knockdown"
