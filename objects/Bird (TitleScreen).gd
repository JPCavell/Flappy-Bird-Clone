extends CharacterBody2D

var fly_switch = false

func _ready():
	$Spritesheet/AnimationPlayer.play("flap")
	
func _process(delta):
	
	if global_position.y < -24 and fly_switch != true:
		global_position.y += 30 * delta
		if (global_position.y >= -24):
			fly_switch = true
	
	if global_position.y > -43 and fly_switch != false:
		global_position.y -= 30 * delta
		if (global_position.y <= -43):
			fly_switch = false
