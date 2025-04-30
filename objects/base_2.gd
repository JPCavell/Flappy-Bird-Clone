extends Sprite2D


func _process(delta):
	global_position.x -= 1.6
	
	if global_position.x <= -625:
		global_position.x = 625
