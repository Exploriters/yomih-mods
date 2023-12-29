extends PlayerInfo

func set_fighter(fighter):
	.set_fighter(fighter)
	fighter.connect("dice_rolled", self, "_on_dice_rolled")
	if player_id == 2:
		$HBoxContainer.alignment = BoxContainer.ALIGN_END
		$HBoxContainer.move_child($"%VBoxContainer", 1)
		$"%SpellBar".fill_mode = TextureProgress.FILL_RIGHT_TO_LEFT
	
func _on_dice_rolled():
	$"%DicePoint".text = str(fighter.currentDicePoint)
	print(fighter.currentDicePoint)
	
func _process(delta):
	if is_instance_valid(fighter):
		$"%SpellBar".value = fighter.SpellLeft / float(fighter.SpellValue)
	if ReplayManager.playback or ReplayManager.play_full:
		$"%Control".rect_size.x = 16
		$"%Control".rect_min_size.x = 16
		$"%Control2".rect_size.x = 16
		$"%Control2".rect_min_size.x = 16
	else:
		$"%Control".rect_size.x = 120
		$"%Control".rect_min_size.x = 120
		$"%Control2".rect_size.x = 120
		$"%Control2".rect_min_size.x = 120
