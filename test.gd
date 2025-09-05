extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$glorp.rotation_degrees = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$glorp.rotation_degrees +=1
