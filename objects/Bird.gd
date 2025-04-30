extends CharacterBody2D

var gravity = 25
var game_start = false
var already_dead = false
var fly_switch = false
var ground_death = false
var fly_position = 220

func _ready():
	$Spritesheet/AnimationPlayer.play("flap")
	$Swoosh.play()
	set_process(false)
	set_physics_process(false)
	get_parent().get_node("top").set_process(false)
	get_parent().get_node("top2").set_process(false)
	get_parent().get_node("bottom").set_process(false)
	get_parent().get_node("bottom2").set_process(false)
	get_parent().get_node("GameOver").visible = false
	get_parent().get_node("Scoreboard").visible = false
	get_parent().get_node("Control2/Score").visible = false
	get_parent().get_node("Control4/BestScore").visible = false
	get_parent().get_node("Control3/TextureButton").visible = false
	await get_tree().create_timer(0.017, false, false, true).timeout
	set_physics_process(true)


func _process(delta):
	global_position.y += 500 * delta
	rotation = lerp_angle(rotation, deg_to_rad(90), 5 * delta)
	if global_position.y >= 265:
		set_process(false)

func _physics_process(delta):
	if Input.is_action_just_pressed("Tap") and game_start != true:
		rotation = lerp_angle(rotation, deg_to_rad(fly_position), 10 * delta)
		global_position.y += -13
		velocity.y = -7
		$Spritesheet/AnimationPlayer.play("Tap")
		$Spritesheet/AnimationPlayer.queue("flap")
		$Flap.play()
		get_parent().get_node("top").set_process(true)
		get_parent().get_node("top2").set_process(true)
		get_parent().get_node("bottom").set_process(true)
		get_parent().get_node("bottom2").set_process(true)
		get_parent().get_node("Message").visible = false
		game_start = true
		Engine.time_scale = 1
	
	
	if global_position.y < -39 and fly_switch != true and game_start != true:
		global_position.y += 45 * delta
		if (global_position.y >= -39):
			fly_switch = true
	
	if global_position.y > -58 and fly_switch != false and game_start != true:
		global_position.y -= 45 * delta
		if (global_position.y <= -58):
			fly_switch = false
	
	
	if game_start != false:
		velocity.y += gravity * delta
		if Input.is_action_just_pressed("Tap"):
			rotation = deg_to_rad(0)
			rotation = lerp_angle(rotation, deg_to_rad(fly_position), 10 * delta)
			global_position.y += -13
			velocity.y = -7
			$Spritesheet/AnimationPlayer.play("Tap")
			$Spritesheet/AnimationPlayer.queue("flap")
			$Flap.play()
		elif velocity.y > 5:
			rotation = lerp_angle(rotation, deg_to_rad(90), 2 * delta)
		move_and_collide(velocity)


func _on_bottom_body_entered(delta):
	if already_dead == false:
		already_dead = true
		death_animation()

func _on_bottom_2_body_entered(delta) -> void:
	if already_dead == false:
		already_dead = true
		death_animation()


func _on_top_body_entered(delta) -> void:
	if already_dead == false:
		already_dead = true
		death_animation()


func _on_top_2_body_entered(delta) -> void:
	if already_dead == false:
		already_dead = true
		death_animation()

func _on_ground_body_entered(delta) -> void:
	if already_dead == false:
		already_dead = true
		ground_death = true
		death_animation()

func death_animation():
	SceneTransition.got_hit()
	$Hit.play()
	set_physics_process(false)
	$Spritesheet/AnimationPlayer.stop()
	$Spritesheet.frame = 1
	get_parent().on_death()
	if ground_death == false:
		$Fall.play()
		set_process(true)
	
