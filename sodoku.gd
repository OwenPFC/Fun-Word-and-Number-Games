extends Node2D

@onready var music = $music
@onready var song = load("res://music/3 - jajaja_2.wav")


# Called when the node enters the scene tree for the first time.
func _ready():
	music.stream = song
	music.play()
	#$SodokuBoard.rotation_degrees = 90 
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#pass
	$SodokuBoard.rotation_degrees += 12 * delta
	$Score.text = "Number Correct: " + str(Global.getNumCorrect()) + "/17"
	
	if(Global.getNumCorrect()==17):
		$"win button".visible = true
	
	
func _on_exit_pressed():
	get_tree().change_scene_to_file("res://menu.tscn")


func _on_sodoku_board_make_visible():
	#$blankBoard.visible=true
	pass


func _on_quit_pressed():
	get_tree().change_scene_to_file("res://menu.tscn")


func _on_music_finished():
	music.play()

func _on_timer_timeout():
	$"win button/cat".flip_h = !$"win button/cat".flip_h


func _on_win_button_pressed():
	get_tree().change_scene_to_file("res://menu.tscn")
