extends PlayerInfo

var tween:SceneTreeTween

func set_fighter(fighter):
	.set_fighter(fighter)
	fighter.connect("dice_rolled", self, "_on_dice_rolled")
	if player_id == 2:
		$HBoxContainer.alignment = BoxContainer.ALIGN_END
	
func _on_dice_rolled():
	$"%DicePoint".text = str(fighter.currentDicePoint)
	print(fighter.currentDicePoint)
