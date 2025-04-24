extends Sprite2D

var pos: Vector2 = Vector2.ZERO
const speed: int = 40
var test_scale = 1
var adjacencyList = {"(0,3)": ["", "(2,4)", "(0,7)", "(1,2)"]}
var correctGame: bool = false

#var dict_variable_key = "Another key name"
#var dict_variable_value = "value2"
#var another_dict = {
	#"Some key name": "value1",
	#dict_variable_key: dict_variable_value,
#}

# Called when the node enters the scene tree for the first time.
func _ready():
	pos = Vector2(300, 300)
	position = pos
	test_scale = .6
	scale = Vector2(test_scale, test_scale)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	#pos.x += speed * delta
	#position = pos
	
	if(Global.getNumCorrect()==17):
		correctGame=true
		print("Game won!!!!!")
		print(":)))))")
		
	#test_scale += 1
	#scale = Vector2(test_scale, test_scale)


#func _on__text_changed():
	#if(Input.is_action_pressed("left")):
		#currentNode = adjacencyList.find_key(currentNode).get(0)
