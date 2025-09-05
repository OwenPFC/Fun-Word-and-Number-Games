extends TextEdit
var totalTime = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	#$TextEdit.text = " ";

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	totalTime+=delta
	$".".text = str(totalTime)
		
	
