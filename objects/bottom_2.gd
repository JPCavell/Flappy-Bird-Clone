extends Area2D


const gap_size = 840

func _process(delta):
	global_position.x -= 1.6
	
	
	
	if global_position.x <= -400:
		global_position.x = get_parent().get_node("top2").global_position.x
		global_position.y = get_parent().get_node("top2").global_position.y + gap_size
