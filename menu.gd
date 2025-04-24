extends Node2D

@onready var sodoku = $sodoku
@onready var crossword = $crossword
@onready var wordsearch = $wordsearch
@onready var connections = $connections
@onready var credits = $credits
@onready var exit = $exit

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


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
	pass # Replace with function body.


func _on_credits_pressed():
	$creditsImage.visible = true
	$creditsImage/exit.disabled = false

func _on_exit_pressed():
	get_tree().quit(0)
