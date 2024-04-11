extends PlayerInfo

func set_fighter(fighter):
	.set_fighter(fighter)
	if player_id == 2:
		$"%FireBar".fill_mode = TextureProgress.FILL_RIGHT_TO_LEFT
		$HBoxContainer.alignment = BoxContainer.ALIGN_END
		$"%Label".align = Label.ALIGN_RIGHT

func _process(delta):
	if is_instance_valid(fighter):
		$"%FireBar".value = fighter.FireLeft
	if ReplayManager.playback or ReplayManager.play_full:
#		$"%Control".rect_size.x = 32
#		$"%Control".rect_min_size.x = 32
#		$"%Control2".rect_size.x = 32
#		$"%Control2".rect_min_size.x = 32
		$HBoxContainer.rect_size.x = 275
	else:
#		$"%Control".rect_size.x = 16
#		$"%Control".rect_min_size.x = 16
#		$"%Control2".rect_size.x = 16
#		$"%Control2".rect_min_size.x = 16
		$HBoxContainer.rect_size.x = 215
