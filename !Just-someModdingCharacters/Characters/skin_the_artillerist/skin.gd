extends Fighter

class_name dndSkin

signal dice_rolled()

var currentDicePoint = 10

var AC = 15

func rollDice():
	var dicePoint = ceil(randi_range(1,20))
	currentDicePoint = dicePoint
	emit_signal("dice_rolled")
