extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$SodokuBoard.rotation_degrees = 90 
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$SodokuBoard.rotation_degrees += 12 * delta
	
	#pos = Vector2(100, 200)
	#position = pos
	if $SodokuBoard.pos.x >2000:
		$SodokuBoard.pos.x = 0
#that's wierd
