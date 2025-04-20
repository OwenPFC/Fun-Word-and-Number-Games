extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Sodoku.rotation_degrees = 90 
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
		$Sodoku.rotation_degrees += 100 * delta
		
		#pos = Vector2(100, 200)
		#position = pos
		if $Sodoku.pos.x >1000:
			$Sodoku.pos.x = 0
