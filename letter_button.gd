extends Button

var letter = ""

signal loseLife

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func setLetter(l:String):
	letter = l

func getType():
	return "word"

func _on_pressed():
	loseLife.emit()
