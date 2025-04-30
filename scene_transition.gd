extends CanvasLayer
var scene_name

func change_scene(scene_name) -> void:
	$Dissolve_rect.color = Color(0, 0, 0)
	$AnimationPlayer.play("dissolve")
	await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_file(scene_name)
	$AnimationPlayer.play_backwards("dissolve")

func got_hit():
	$Dissolve_rect.color = Color(255, 255, 255)
	$AnimationPlayer.play("dissolve")
	await $AnimationPlayer.animation_finished
	$AnimationPlayer.play_backwards("dissolve")
