extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	#$SodokuBoard.rotation_degrees = 90 
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	$SodokuBoard.rotation_degrees += 12 * delta
	
func _on_exit_pressed():
	get_tree().change_scene_to_file("res://menu.tscn")
	
	#if(Global.getNumCorrect()==17):
		#$glorp.visible=true
		#$blankBoard.visible=true


func _on_sodoku_board_make_visible():
	$blankBoard.visible=true
