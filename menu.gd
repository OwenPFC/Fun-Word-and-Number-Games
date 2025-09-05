extends Node2D

@onready var sodoku = $sodoku
@onready var crossword = $crossword
@onready var wordsearch = $wordsearch
@onready var connections = $connections
@onready var credits = $credits
@onready var exit = $exit

@onready var music = $music
@onready var song = load("res://music/song of life.wav")

@onready var sodoku_pic = load("res://menu sodoku.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	music.stream = song
	music.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_sodoku_pressed():
	get_tree().change_scene_to_file("res://sodoku.tscn")

func _on_crossword_pressed():
	get_tree().change_scene_to_file("res://crossword.tscn")

func _on_wordsearch_pressed():
	get_tree().change_scene_to_file("res://wordsearch.tscn")

func _on_connections_pressed():
	get_tree().change_scene_to_file("res://connections.tscn")


func _on_credits_pressed():
	$creditsImage.visible = true
	$creditsImage/leaveCredits.disabled = false
	
	$sodoku.disabled = true
	$crossword.disabled = true
	$wordsearch.disabled = true
	$connections.disabled = true

func _on_exit_pressed():
	get_tree().quit(0)


func _on_leave_credits_pressed():
	$creditsImage.visible = false
	$creditsImage/leaveCredits.disabled = true
	
	$sodoku.disabled = false
	$crossword.disabled = false
	$wordsearch.disabled = false
	$connections.disabled = false


func _on_music_finished():
	music.stream = song
	music.play()


func _on_wordsearch_mouse_entered():
	$wordsearch_warning.visible = true


func _on_wordsearch_mouse_exited():
	$wordsearch_warning.visible = false


func _on_sodoku_mouse_entered():
	$sodoku.icon = sodoku_pic
	
func _on_sodoku_mouse_exited():
	$sodoku.icon = null
