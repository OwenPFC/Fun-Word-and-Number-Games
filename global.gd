extends Node

var numCorrect: int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	numCorrect = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	#print(getNumCorrect())

func _incNumCorrect():
	numCorrect+=1

func _decNumCorrect():
	numCorrect-=1
	
func getNumCorrect():
	return numCorrect
