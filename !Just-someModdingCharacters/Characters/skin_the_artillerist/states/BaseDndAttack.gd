extends CharacterState
onready var hitbox = $Hitbox

var initGuardBreak = false
var initDamage = 0
var damage_multi = 0.0

func _enter():
	host.rollDice()
	initGuardBreak = hitbox.guard_break
	damage_multi = 0.0  + host.currentDicePoint * 0.1
	if host.currentDicePoint == 1:
		damage_multi = 0.0
		host.hp = host.hp - hitbox.damage * 0.5
	if host.currentDicePoint == 20:
		damage_multi = 2.0
		hitbox.guard_break = true
	print("initDamage:",hitbox.damage)
	initDamage = hitbox.damage
	hitbox.damage = ceil(hitbox.damage * damage_multi)
	print("multi:",damage_multi,"\n damage:",hitbox.damage)

func _exit():
	hitbox.guard_break = initGuardBreak
	hitbox.damage = initDamage
