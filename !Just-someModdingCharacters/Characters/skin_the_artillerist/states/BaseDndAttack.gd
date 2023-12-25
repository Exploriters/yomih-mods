extends CharacterState

class_name baseDndAttack

onready var hitbox = $Hitbox

var initDamage = 0
var damage_multi = 0.0

func _enter():
	host.rollDice()
	damage_multi = 0.0  + host.currentDicePoint * 0.1
	if host.currentDicePoint == 1:
		damage_multi = 0.0
		host.hp = host.hp - hitbox.damage * 0.5
	if host.currentDicePoint == 20:
		damage_multi = 2.0
	print("initDamage:",hitbox.damage)
	initDamage = hitbox.damage
	hitbox.damage = ceil(hitbox.damage * damage_multi)
	print("multi:",damage_multi,"\n damage:",hitbox.damage)

func _exit():
	hitbox.damage = initDamage
