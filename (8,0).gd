extends TextEdit
var boxCorrect = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	#$TextEdit.text = " ";

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _checkBox():
	if($".".text=="VIII"):
		Global._incNumCorrect()

		
func _on_text_changed():
	_checkBox()
