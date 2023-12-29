extends Fighter

class_name dndSkin

signal dice_rolled()

var currentDicePoint = 10

var SpellValue = 14
var SpellLeft = 0
var canUseShockingGrasp = true
var ShockingGraspColddown = 0

var AC = 15

func init(pos = null):
	.init(pos)
	SpellLeft = SpellValue
	 
func rollDice():
	var dicePoint = ceil(randi_range(1,20))
	currentDicePoint = dicePoint
	emit_signal("dice_rolled")

func tick():
	.tick()
	if SpellLeft < SpellValue:
		SpellLeft += 0.1
	if ShockingGraspColddown > 0:
		ShockingGraspColddown -= 1
	else:
		ShockingGraspColddown = 0
		canUseShockingGrasp = true
		$"%ShockingEffectFail".stop_emitting()
		$"%ShockingEffect".stop_emitting()
