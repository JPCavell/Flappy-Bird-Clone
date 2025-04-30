extends Camera2D

var mouse_event = InputEventMouseButton.new()

func _ready() -> void:
	mouse_event.button_index = MOUSE_BUTTON_LEFT
	InputMap.action_erase_event("Tap", mouse_event)
	Engine.time_scale = 1.2

func _process(delta):
	if Input.is_action_just_pressed("Tap"):
		InputMap.action_add_event("Tap", mouse_event)
		SceneTransition.change_scene("res://objects/background.tscn")

func _on_texture_button_title_pressed() -> void:
	InputMap.action_add_event("Tap", mouse_event)
	SceneTransition.change_scene("res://objects/background.tscn")


func _on_texture_button_right_pressed() -> void:
	get_tree()


func _on_texture_button_left_pressed() -> void:
	pass # Replace with function body.
