extends Node2D

@onready var make = $make
@onready var wake = $wake
@onready var eat = $eat
@onready var pack = $pack
@onready var shower = $shower
@onready var macbeth = $macbeth
@onready var fog = $fog
@onready var umbrella = $umbrella
@onready var salt = $salt
@onready var four = $four
@onready var shoot = $shoot
@onready var sniff = $sniff
@onready var snort = $snort
@onready var blow = $blow
@onready var pick = $pick
@onready var wordsearch = $wordsearch
@onready var crossword = $crossword
@onready var maze = $maze
@onready var sudoku = $sudoku
@onready var connections = $connections

@onready var connectionDict = {
	make:"up",
	wake:"up",
	eat:"up",
	pack:"up",
	shower:"x",
	macbeth:"bad",
	umbrella:"bad",
	salt:"bad",
	four:"bad",
	fog:"x",
	pick:"nose",
	blow:"nose",
	snort:"nose",
	sniff:"nose",
	shoot:"x",
	connections:"this",
	wordsearch:"this",
	crossword:"this",
	sudoku:"this",
	maze:"x"
}
	
	

@onready var beige = load("res://connections assets/beige.png")
@onready var grey = load("res://connections assets/grey.png")

var activeList = []

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	
func calculateCorrect():
	if(len(activeList) == 4):
		var category = connectionDict.get(activeList[0])
		var numCorrect = 0
		for word in activeList:
			if(connectionDict.get(word) == category):
				numCorrect+=1
		if(numCorrect == 3):
			$one_away.visible = true
		elif(numCorrect == 4):
			return true
		else:
			return false
			
func loseLife():
	pass
	
	
	
	
	
func chooseHighlight(button:Button):
	button.set("theme_override_colors/font_color", Color(0, 0, 0))
	if(button in activeList):
		button.get_child(0).texture = grey
	else:
		button.get_child(0).texture = beige


func _on_make_pressed():
	if(make in activeList):
		activeList.remove_at(activeList.find(make))
	else:
		if(len(activeList)<4):
			activeList.append(make)
	chooseHighlight(make)


func _on_wake_pressed():
	if(wake in activeList):
		activeList.remove_at(activeList.find(wake))
	else:
		if(len(activeList)<4):
			activeList.append(wake)
	chooseHighlight(wake)

func _on_eat_pressed():
	if(eat in activeList):
		activeList.remove_at(activeList.find(eat))
	else:
		if(len(activeList)<4):
			activeList.append(eat)
	chooseHighlight(eat)


func _on_pack_pressed():
	if(pack in activeList):
		activeList.remove_at(activeList.find(pack))
	else:
		if(len(activeList)<4):
			activeList.append(pack)
	chooseHighlight(pack)


func _on_shower_pressed():
	if(shower in activeList):
		activeList.remove_at(activeList.find(shower))
	else:
		if(len(activeList)<4):
			activeList.append(shower)
	chooseHighlight(shower)


func _on_macbeth_pressed():
	if(macbeth in activeList):
		activeList.remove_at(activeList.find(macbeth))
	else:
		if(len(activeList)<4):
			activeList.append(macbeth)
	chooseHighlight(macbeth)


func _on_umbrella_pressed():
	if(umbrella in activeList):
		activeList.remove_at(activeList.find(umbrella))
	else:
		if(len(activeList)<4):
			activeList.append(umbrella)
	chooseHighlight(umbrella)


func _on_salt_pressed():
	if(salt in activeList):
		activeList.remove_at(activeList.find(salt))
	else:
		if(len(activeList)<4):
			activeList.append(salt)
	chooseHighlight(salt)


func _on_fog_pressed():
	if(fog in activeList):
		activeList.remove_at(activeList.find(fog))
	else:
		if(len(activeList)<4):
			activeList.append(fog)
	chooseHighlight(fog)


func _on_four_pressed():
	if(four in activeList):
		activeList.remove_at(activeList.find(four))
	else:
		if(len(activeList)<4):
			activeList.append(four)
	chooseHighlight(four)


func _on_pick_pressed():
	if(pick in activeList):
		activeList.remove_at(activeList.find(pick))
	else:
		if(len(activeList)<4):
			activeList.append(pick)
	chooseHighlight(pick)


func _on_blow_pressed():
	if(blow in activeList):
		activeList.remove_at(activeList.find(blow))
	else:
		if(len(activeList)<4):
			activeList.append(blow)
	chooseHighlight(blow)

func _on_snort_pressed():
	if(snort in activeList):
		activeList.remove_at(activeList.find(snort))
	else:
		if(len(activeList)<4):
			activeList.append(snort)
	chooseHighlight(snort)


func _on_sniff_pressed():
	if(sniff in activeList):
		activeList.remove_at(activeList.find(sniff))
	else:
		if(len(activeList)<4):
			activeList.append(sniff)
	chooseHighlight(sniff)


func _on_shoot_pressed():
	if(shoot in activeList):
		activeList.remove_at(activeList.find(shoot))
	else:
		if(len(activeList)<4):
			activeList.append(shoot)
	chooseHighlight(shoot)


func _on_wordsearch_pressed():
	if(wordsearch in activeList):
		activeList.remove_at(activeList.find(wordsearch))
	else:
		if(len(activeList)<4):
			activeList.append(wordsearch)
	chooseHighlight(wordsearch)


func _on_crossword_pressed():
	if(crossword in activeList):
		activeList.remove_at(activeList.find(crossword))
	else:
		if(len(activeList)<4):
			activeList.append(crossword)
	chooseHighlight(crossword)

func _on_sudoku_pressed():
	if(sudoku in activeList):
		activeList.remove_at(activeList.find(sudoku))
	else:
		if(len(activeList)<4):
			activeList.append(sudoku)
	chooseHighlight(sudoku)

func _on_maze_pressed():
	if(maze in activeList):
		activeList.remove_at(activeList.find(maze))
	else:
		if(len(activeList)<4):
			activeList.append(maze)
	chooseHighlight(maze)

func _on_connections_pressed():
	if(connections in activeList):
		activeList.remove_at(activeList.find(connections))
	else:
		if(len(activeList)<4):
			activeList.append(connections)
	chooseHighlight(connections)

func _on_deselect_all_pressed():
	for word in activeList:
		activeList.remove_at(activeList.find_child())
	activeList = []
