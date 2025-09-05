extends Sprite2D

signal makeVisible
var pos: Vector2 = Vector2.ZERO
const speed: int = 100
var test_scale = 1
var adjacencyList = {"(0,3)": ["", "(2,4)", "(0,7)", "(1,2)"]}
var correctGame: bool = false
var moveLeft = false
var moveRight = false
var moveUp = false
var moveDown = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pos = Vector2(300, 300)
	position = pos
	test_scale = .6
	scale = Vector2(test_scale, test_scale)
	moveLeft = false
	moveRight = true
	moveUp = true
	moveDown = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#pass
	if(pos.x<250):
		moveLeft = false
		moveRight = true
	if(pos.x>1650):
		moveLeft = true
		moveRight = false
	if(pos.y<230):
		moveUp = false
		moveDown = true
	if(pos.y>730):
		moveUp = true
		moveDown = false
		
	if(moveUp):
		pos.y -= speed*delta
		position = pos
	if(moveDown):
		pos.y += speed*delta
		position = pos
	if(moveLeft):
		pos.x -= speed*delta
		position = pos
	if(moveRight):
		pos.x += speed*delta
		position = pos
	
	
	if(Global.getNumCorrect()==17):
		$glorp.visible=true
		#$blankBoard.visible=true
		makeVisible.emit()
		
	#if(position==1700):
		#


#func _on__text_changed():
	#if(Input.is_action_pressed("left")):
		#currentNode = adjacencyList.find_key(currentNode).get(0)
