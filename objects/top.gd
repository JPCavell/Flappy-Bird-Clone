extends Area2D

var point_counted

func _process(delta):
	global_position.x -= 1.6
	
	if global_position.x <= -125 and point_counted != true:
		get_parent().get_node("Control/Points").point()
		point_counted = true
	
	if global_position.x <= -400:
		global_position.x = randi_range(330, 350)
		global_position.y = randi_range(-300, -750)
		point_counted = false
		
