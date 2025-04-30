extends Label

var points

func best_score_count():
	points = get_parent().get_parent().load_best_score()
	text = str(points - 1)
