extends Node2D

@onready var blueColor = load("res://connections assets/blueReal.png")
@onready var greenColor = load("res://connections assets/green.png")
@onready var hellColor = load("res://connections assets/hell.png")
@onready var purpleColor = load("res://connections assets/purple.png")
@onready var yellowColor = load("res://connections assets/yellow.png")

@onready var music = $music
@onready var song = load("res://music/12 - the song of song 2.wav")
@onready var song2 = load("res://music/14 - song of song john riddim remix.wav")

@onready var make = $make
@onready var work = $work
@onready var morning = $morning
@onready var fon = $fon
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

@onready var explosion8 = $explosion8

@onready var connectionDict = {
	make:"do",
	work:"do",
	morning:"do",
	fon:"do",
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

var explosionSound = load("res://word search assets/mixkit-epic-impact-afar-explosion-2782.wav")
@onready var sound = $explosionSound

@onready var life1 = $life1
@onready var life2 = $life2
@onready var life3 = $life3
@onready var life4 = $life4

@onready var yellow = $yellow
@onready var green = $green
@onready var blue = $blue
@onready var purple = $purple
@onready var hell = $hell

@onready var lives = [life1,life2,life3,life4]
@onready var activeLife = life1

var activeList = []
var categories = ["this","do","bad","nose","x"]

@onready var categoryDict = {"this":yellow,"nose":green,"bad":blue,"do":purple,"x":hell}
@onready var colorDict = {yellow:yellowColor,green:greenColor,blue:blueColor,purple:purpleColor,hell:hellColor}

# Called when the node enters the scene tree for the first time.
func _ready():
	music.stream = song
	music.play()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if(len(activeList) == 4):
		$submit.disabled = false
	else:
		$submit.disabled = true
	
	if(len(lives) == 0):
		$lose.disabled = false
		$lose.visible = true
		
	if($yellow.visible and $green.visible and $blue.visible and $purple.visible and $hell.visible):
		$win.disabled = false
		$win.visible = true
	
func loseLife():
	print("hello")
	if(len(lives) > 0):
		activeLife = lives[0]
		lives.remove_at(0)
		
		explosion8.global_position.x = activeLife.global_position.x
		explosion8.global_position.y = activeLife.global_position.y
		explosion8.visible = true
		explosion8.play("explosion")
		sound.stream = explosionSound
		sound.play()
		activeLife.visible = false


func calculateCorrect():
	if(len(activeList) == 4):
		var category = connectionDict.get(activeList[0])
		var numCorrect = 0
		for word in activeList:
			if(connectionDict.get(word) == category):
				numCorrect+=1
		if(numCorrect == 3):
			$one_away.visible = true
			return false
		elif(numCorrect == 4):
			return true
		else:
			return false
			
func winCategory():
	var category = connectionDict.get(activeList[0])
	var color = categoryDict.get(category)
	color.visible = true
	
	if(category == "this"):
		$this.visible = true
	elif(category == "nose"):
		$nose.visible = true
	elif(category == "bad"):
		$bad.visible = true
	elif(category == "do"):
		$do.visible = true
	elif(category == "x"):
		$x.visible = true
	
	
	
	for word in activeList:
		word.get_child(0).texture = colorDict.get(color)
		word.disabled = true
		
	activeList = []
	
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
	if(work in activeList):
		activeList.remove_at(activeList.find(work))
	else:
		if(len(activeList)<4):
			activeList.append(work)
	chooseHighlight(work)

func _on_eat_pressed():
	if(morning in activeList):
		activeList.remove_at(activeList.find(morning))
	else:
		if(len(activeList)<4):
			activeList.append(morning)
	chooseHighlight(morning)


func _on_pack_pressed():
	if(fon in activeList):
		activeList.remove_at(activeList.find(fon))
	else:
		if(len(activeList)<4):
			activeList.append(fon)
	chooseHighlight(fon)


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
	while(len(activeList)>0):
		var temp = activeList[0]
		activeList.remove_at(0)
		chooseHighlight(temp)
	activeList = []

func _on_submit_pressed():
	if($one_away.visible):
		$one_away.visible = false
	if(!calculateCorrect()):
		loseLife()
	else:
		winCategory()
		


func _on_lose_pressed():
	get_tree().reload_current_scene()


func _on_win_pressed():
	get_tree().change_scene_to_file("res://menu.tscn")


func _on_quit_pressed():
	$exit.disabled = false
	$exit.visible = true
	$exit/return.disabled = false

func _on_return_pressed():
	$exit.disabled = true
	$exit.visible = false
	$exit/return.disabled = true


func _on_exit_pressed():
	get_tree().change_scene_to_file("res://menu.tscn")


func _on_music_finished():
	music.stream = song2
	music.play()


func _on_duck_timer_timeout():
	print("duckman")
	$win/Duck.flip_h = !$win/Duck.flip_h
