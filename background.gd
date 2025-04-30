extends Camera2D

var best_score = 0
var current_score = 0
var save_path = "user://save_data.cfg"
var mouse_event = InputEventMouseButton.new()

func _ready():
	load_best_score()
	set_process(false)

func on_death():
	$Control/Points/GetPoint.volume_db = -80
	current_score = $Control/Points.point()
	if best_score < current_score:
		best_score = current_score
		save_best_score()
	
	$Ground.stop()
	$"bottom".set_process(false)
	$"bottom2".set_process(false)
	$"top".set_process(false)
	$"top2".set_process(false)
	$Control/Points.visible = false
	$GameOver/AnimationPlayer.play("Fade_in")
	$GameOver.visible = true
	$Scoreboard.visible = true
	$Scoreboard/AnimationPlayer.play("slide_in")
	await get_tree().create_timer(1.3, false, false, true).timeout
	$Control2/Score.visible = true
	$Control3/TextureButton.visible = true
	$Control4/BestScore.visible = true
	$Control2/Score.score_count()
	$Control4/BestScore.best_score_count()
	mouse_event.button_index = MOUSE_BUTTON_LEFT
	InputMap.action_erase_event("Tap", mouse_event)
	set_process(true)

func _on_texture_button_pressed() -> void:
	InputMap.action_add_event("Tap", mouse_event)
	SceneTransition.change_scene("res://objects/background.tscn")

func _process(delta):
	if Input.is_action_just_pressed("Tap"):
		InputMap.action_add_event("Tap", mouse_event)
		SceneTransition.change_scene("res://objects/background.tscn")

func save_best_score():
	var config = ConfigFile.new()
	config.set_value("scores", "best_score", best_score)
	config.save(save_path)
	

func load_best_score():
	var config = ConfigFile.new()
	if config.load(save_path) == OK:  # Check if the save file exists
		best_score = config.get_value("scores", "best_score", 0)
	return best_score
