extends Label

var points = 0

func point():
	points += 1
	text = str(points)
	$GetPoint.play()
	return points
