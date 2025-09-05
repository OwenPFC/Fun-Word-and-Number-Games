extends Node2D


@onready var music = $music
@onready var song = load("res://music/25 - jazz scat galore!.wav")


@onready var h = $h
@onready var a = $a
@onready var l2 = $l2
@onready var l3 = $l3
@onready var o3 = $o3
@onready var g2 = $g2
@onready var a2 = $a2
@onready var e2 = $e2
@onready var o2 = $o2
@onready var r2 = $r2
@onready var p2 = $p2
@onready var t2 = $t2
@onready var y = $y
@onready var g = $g
@onready var g3 = $g3
@onready var a3 = $a3
@onready var j = $j
@onready var i = $i
@onready var n = $n
@onready var t = $t
@onready var e = $e
@onready var s = $s
@onready var t3 = $t3

@onready var activeBox = h

@onready var word1 = [h,a,l2,l3,o3]
@onready var word2 = [i,n,g2,o2,t2]
@onready var word3 = [t,e,a2,r2,y]
@onready var word4 = [s,t3,e2,p2]
@onready var word5d = [j,a3,g3,g]

@onready var word1a = [h,i,t,s]
@onready var word5a = [j,a,n,e,t3]
@onready var word6 = [a3,l2,g2,a2,e2]
@onready var word7 = [g3,l3,o2,r2,p2]
@onready var word8 = [g,o3,t2,y]

@onready var wordList = [word1,word1a,word2,word3,word4,word5a,word5d,word6,word7,word8]

@onready var activeWord = word1
@onready var blue_box = load("res://blue_box.tres")
var boxIndex = 0

@onready var blue = load("res://crossword assets/blue.png")
@onready var yellow = load("res://crossword assets/yellow.png")
@onready var white = load("res://crossword assets/white.png")

var activeDirection = "vert"

var mouseInExit = false

var puzzleComplete = false

#node:[wordV,wordH]
@onready var wordsIn:Dictionary = {
h:[word1,word1a],
a:[word1,word5a],
l2:[word1,word6],
l3:[word1,word7],
o3:[word1,word8],
g2:[word2,word6],
a2:[word3,word6],
e2:[word4,word6],
o2:[word2,word7],
r2:[word3,word7],
p2:[word4,word7],
t2:[word2,word8],
y:[word3,word8],
g:[word5d,word8],
g3:[word5d,word7],
a3:[word5d,word6],
j:[word5d,word5a],
i:[word2,word1a],
n:[word2,word5a],
t:[word3,word1a],
e:[word3,word5a],
s:[word4,word1a],
t3:[word4,word5a],
}

# Called when the node enters the scene tree for the first time.
func _ready():
	
	music.stream  = song
	music.play()
	
	$h.grab_focus()
	highlightBox()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	activeBox.text = activeBox.text.to_upper()
	
	if(isPuzzleFull()):
		puzzleComplete = validatePuzzle()
	
	if(puzzleComplete):
		$win.disabled = false
		$win.visible = true



func _input(event):
	if event is InputEventKey:
		if(Input.is_action_just_released("type")):
			activeBox.text = event.as_text_keycode()
			
			if(boxIndex+1<len(activeWord)):
				activeBox.get_child(0).texture = blue
				activeBox = activeWord[boxIndex+1] 
				boxIndex+=1
				activeBox.get_child(0).texture = yellow
		else:
			var currentDirection = activeDirection
			chooseActiveWord()
			if(Input.is_action_just_pressed("ui_up") or Input.is_action_just_pressed("ui_left")):
				if(activeDirection==currentDirection):
					if(boxIndex-1 >= 0):
						activeBox = activeWord[boxIndex-1] 
						boxIndex-=1
			if(Input.is_action_just_pressed("ui_down") or Input.is_action_just_pressed("ui_right")):
				if(activeDirection == currentDirection):
					if(boxIndex+1<len(activeWord)):
						activeBox = activeWord[boxIndex+1]
						boxIndex+=1
		activeBox.grab_focus()
	elif(Input.is_action_just_released("click") and !mouseInExit and !$quitScreen.visible):
		activeBox = get_viewport().gui_get_focus_owner()
		activeBox.grab_focus()
		chooseActiveWord()
	if(Input.is_action_just_pressed("ui_text_backspace")):
		activeBox.text = ""

func chooseActiveWord():
	unHighlightBox()
	if(Input.is_action_just_pressed("ui_up") or Input.is_action_just_pressed("ui_down") or (Input.is_action_just_released("click") and activeBox is LineEdit and !mouseInExit) and !$quitScreen.visible):
		if(wordsIn.get(activeBox,h)[0]!=[]):
			activeWord = wordsIn.get(activeBox,h)[0]
			activeDirection = "vert"
		else:
			activeWord = wordsIn.get(activeBox,h)[1]
			activeDirection = "horiz"
	if(Input.is_action_just_pressed("ui_left") or Input.is_action_just_pressed("ui_right") or (Input.is_action_just_released("click") and activeBox is LineEdit and !mouseInExit) and !$quitScreen.visible):
		if(wordsIn.get(activeBox,h)[1]!=[]):
			activeWord = wordsIn.get(activeBox,h)[1]
			activeDirection = "horiz"
		else:
			if(activeBox is LineEdit):
				activeWord = wordsIn.get(activeBox,h)[0]
				activeDirection = "vert"
	boxIndex = activeWord.find(activeBox)
	highlightBox()
	
func isPuzzleFull():
	for word in wordList:
		for letter in word:
			if(len(letter.text)==0):
				return false
	return true
	
func validatePuzzle():
	for letter in wordsIn:
		if(letter.text.to_lower() != letter.get_name().substr(0,1)):
			return false
	return true

func highlightBox():
	for letter in activeWord:
		if(letter!=activeBox):
			letter.get_child(0).texture = blue
		else:
			letter.get_child(0).texture = yellow

func unHighlightBox():
	for letter in activeWord:
		letter.get_child(0).texture = white
		
func _on_exit_pressed():
	get_tree().change_scene_to_file("res://menu.tscn")

func _on_exit_mouse_entered():
	mouseInExit = true
	$quitScreen/exit/Sprite2D.visible = true

func _on_exit_mouse_exited():
	mouseInExit = false
	$quitScreen/exit/Sprite2D.visible = false

func _on_quit_pressed():
	$quitScreen.visible = true
	$quitScreen/return.disabled = false
	$quitScreen/exit.disabled = false

func _on_quit_mouse_entered():
	mouseInExit = true
	$quit/Sprite2D.visible = true
	$quit/Sprite2D2.visible = true
	
func _on_quit_mouse_exited():
	mouseInExit = false
	$quit/Sprite2D.visible = false
	$quit/Sprite2D2.visible = false

func _on_return_pressed():
	$quitScreen/return.disabled = true
	$quitScreen/exit.disabled = true
	$quitScreen.visible = false


func _on_return_mouse_entered():
	mouseInExit = true


func _on_return_mouse_exited():
	mouseInExit = false


func _on_h_pressed():
	activeBox = $h
	chooseActiveWord()


func _on_a_pressed():
	activeBox =$a
	chooseActiveWord()

func _on_l_2_pressed():
	activeBox =$l2
	chooseActiveWord()

func _on_l_3_pressed():
	activeBox =$l3
	chooseActiveWord()

func _on_o_3_pressed():
	activeBox =$o3
	chooseActiveWord()

func _on_i_pressed():
	activeBox =$i
	chooseActiveWord()

func _on_n_pressed():
	activeBox =$n
	chooseActiveWord()

func _on_g_2_pressed():
	activeBox =$g2
	chooseActiveWord()

func _on_o_2_pressed():
	activeBox =$o2
	chooseActiveWord()

func _on_t_2_pressed():
	activeBox =$t2
	chooseActiveWord()

func _on_t_pressed():
	activeBox =$t
	chooseActiveWord()

func _on_e_pressed():
	activeBox =$e
	chooseActiveWord()

func _on_a_2_pressed():
	activeBox =$a2
	chooseActiveWord()

func _on_r_2_pressed():
	activeBox =$r2
	chooseActiveWord()

func _on_y_pressed():
	activeBox =$y
	chooseActiveWord()

func _on_s_pressed():
	activeBox =$s
	chooseActiveWord()

func _on_t_3_pressed():
	activeBox =$t3
	chooseActiveWord()

func _on_e_2_pressed():
	activeBox =$e2
	chooseActiveWord()

func _on_p_2_pressed():
	activeBox =$p2
	chooseActiveWord()

func _on_j_pressed():
	activeBox =$j
	chooseActiveWord()

func _on_a_3_pressed():
	activeBox =$a3
	chooseActiveWord()

func _on_g_3_pressed():
	activeBox =$g3
	chooseActiveWord()

func _on_g_pressed():
	activeBox =$g
	chooseActiveWord()


func _on_win_pressed():
	get_tree().change_scene_to_file("res://menu.tscn")


func _on_music_finished():
	music.play()
