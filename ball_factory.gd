extends Node2D

@export var ball_scene: PackedScene = preload("res://ball.tscn")

func _unhandled_input(event: InputEvent) -> void:
	if event.is_echo():
		return

	if event is InputEventMouseButton and event.is_pressed():
		if event.button_index == MOUSE_BUTTON_LEFT:
			var p: Vector2
			p = get_global_mouse_position()
			p.y = 0
			spawn(p)


func spawn(spawn_global_position: Vector2) -> void:
	var instance: Node2D = ball_scene.instantiate()
	instance.global_position = spawn_global_position
	
	# Get the AnimatedSprite2D node from the instance
	var animated_sprite: AnimatedSprite2D = instance.get_node("AnimatedSprite2D")
	
	# Get the animation names from the sprite frames
	var mob_types = Array(animated_sprite.sprite_frames.get_animation_names())
	
	# Select a random animation
	animated_sprite.animation = mob_types.pick_random()
	
	# Play the animation
	animated_sprite.play()
	
	add_child(instance)
