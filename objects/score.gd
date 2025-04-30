extends Label

var score = 0
var points
var score_check = false

func score_count():
	points = get_parent().get_parent().get_node("Control/Points").point()
	while score < points and score_check == false:
		text = str(score-1)
		score += 1
		await get_tree().create_timer(0.017, false, false, true).timeout
	score_check = true
	
