extends Sprite2D

var pos: Vector2 = Vector2.ZERO
const speed: int = 40
var test_scale = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pos = Vector2(100, 300)
	position = pos
	test_scale = .6
	scale = Vector2(test_scale, test_scale)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pos.x += speed * delta
	position = pos
	
	#test_scale += 1
	#scale = Vector2(test_scale, test_scale)
