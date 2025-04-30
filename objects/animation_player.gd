extends AnimationPlayer

var flap_speed = 0.5

func _process(delta):
	advance(delta * flap_speed)
	
