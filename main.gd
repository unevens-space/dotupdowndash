extends Node

@export var mob_scene: PackedScene
var score

func game_over():
	$ScoreTimer.stop()
	$MobTimer.stop()
	$HUD.show_game_over()
	$DeathSound.play()

func new_game():
	score = 0
	$Music.play()

	$StartTimer.start()
	$HUD.update_score(score)
	$HUD.show_message("Click the mouse to spawn a new instance.")
	#get_tree().call_group("mobs", "queue_free")

func _on_score_timer_timeout():
	score += 1
	$HUD.update_score(score)
	
func _on_start_timer_timeout():
	$ScoreTimer.start()
