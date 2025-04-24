extends Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$".".rotation_degrees = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$".".rotation_degrees += 30 * delta

