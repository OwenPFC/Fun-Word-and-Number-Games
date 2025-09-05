extends LineEdit
var mouse_entered1 = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$TextEdit.text = " ";

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#clicking
	if(mouse_entered1):
		pass

func _on_mouse_entered():
	mouse_entered1 = true
