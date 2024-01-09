extends Fighter

class_name dndSkin

signal dice_rolled()

var currentDicePoint = 10

var OnShielding = false
var canUseShield = true
var initDTM = self.damage_taken_modifier

var SpellValue = 27
var SpellLeft = 0
var canUseShockingGrasp = true
var ShockingGraspColddown = 0

func init(pos = null):
	.init(pos)
	SpellLeft = SpellValue
	 
func rollDice():
	var dicePoint = ceil(randi_range(1,20))
	currentDicePoint = dicePoint
	emit_signal("dice_rolled")

func tick():
	.tick()
	
	if OnShielding == true:
		var shieldingDTM = String(float(initDTM) / 2)
		self.damage_taken_modifier = shieldingDTM
		if is_in_hurt_state():
			var pos = self.position
			pos.x *= self.get_facing_int()
			spawn_particle_effect(preload("res://fx/FeintEffect.tscn"), pos)
			$"%ShieldEffect".stop_emitting()
			$"%ShieldEffect".visible = false
			OnShielding = false
	else:
		self.damage_taken_modifier = initDTM
		canUseShield = true
	
	if SpellLeft < SpellValue:
		SpellLeft += 0.025
		
	if ShockingGraspColddown > 0:
		ShockingGraspColddown -= 1
	else:
		ShockingGraspColddown = 0
		canUseShockingGrasp = true
		$"%ShockingEffectFail".stop_emitting()
		$"%ShockingEffect".stop_emitting()
