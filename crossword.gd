extends Node2D

"""
I think what we can do is name nodes like a,a1,a2, whatever, and there must be a node getname function where
we then just take the first letter and see if it matches with the input letter
"""

@onready var a = $a
@onready var b = $b
@onready var c = $c
@onready var d = $d
@onready var e = $e
@onready var f = $f
@onready var g = $g
@onready var h = $h
@onready var i = $i
@onready var j = $j
@onready var k = $k
@onready var l = $l
@onready var m = $m
@onready var n = $n
@onready var o = $o
@onready var p = $p
@onready var q = $q
@onready var r = $r
@onready var s = $s
@onready var t = $t
@onready var u = $u
@onready var v = $v
@onready var w = $w

@onready var activeBox = a

@onready var word1 = [a,b,c,d,e]
@onready var word2 = [r,s,f,i,l]
@onready var word3 = [t,u,g,j,m]
@onready var word4 = [v,w,h,k]
@onready var word5d = [q,p,o,n]

@onready var word1a = [a,r,t,v]
@onready var word5a = [q,b,s,u,w]
@onready var word6 = [p,c,f,g,h]
@onready var word7 = [o,d,i,j,k]
@onready var word8 = [n,e,l,m]

@onready var activeWord = word1
@onready var blue_box = load("res://blue_box.tres")
var boxIndex = 0

@onready var blue = load("res://crossword assets/blue.png")
@onready var yellow = load("res://crossword assets/yellow.png")
@onready var white = load("res://crossword assets/white.png")

#node:[wordV,wordH]
@onready var wordsIn:Dictionary = {
a:[word1,word1a],
b:[word1,word5a],
c:[word1,word6],
d:[word1,word7],
e:[word1,word8],
f:[word2,word6],
g:[word3,word6],
h:[word4,word6],
i:[word2,word7],
j:[word3,word7],
k:[word4,word7],
l:[word2,word8],
m:[word3,word8],
n:[word5d,word8],
o:[word5d,word7],
p:[word5d,word6],
q:[word5d,word5a],
r:[word2,word1a],
s:[word2,word5a],
t:[word3,word1a],
u:[word3,word5a],
v:[word4,word1a],
w:[word4,word5a],
}

# Called when the node enters the scene tree for the first time.
func _ready():
	$a.grab_focus()
	highlightBox()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	activeBox.text = activeBox.text.to_upper()
	#if(len(activeBox.text)>1):
		#activeBox.text = activeBox.text[1]
	

func _input(event):
	if event is InputEventKey:
		if(Input.is_action_just_released("type")):
			activeBox.text = event.as_text_keycode()
			
			if(boxIndex+1<len(activeWord)):
				#activeBox.set("theme_override_colors/background_color",Color(Color.SKY_BLUE))
				activeBox.get_child(0).texture = blue
				activeBox = activeWord[boxIndex+1] 
				boxIndex+=1
				activeBox.get_child(0).texture = yellow
				#activeBox.set("theme_override_colors/background_color",Color(Color.GOLD))
		else:
			chooseActiveWord()
			if(Input.is_action_just_pressed("ui_up") or Input.is_action_just_pressed("ui_left")):
				if(boxIndex-1 >= 0):
					activeBox = activeWord[boxIndex-1] 
					boxIndex-=1
			if(Input.is_action_just_pressed("ui_down") or Input.is_action_just_pressed("ui_right")):
				if(boxIndex+1<len(activeWord)):
					activeBox = activeWord[boxIndex+1]
					boxIndex+=1
		activeBox.grab_focus()
	elif(Input.is_action_just_released("click")):
		activeBox = get_viewport().gui_get_focus_owner()
		activeBox.grab_focus()
		chooseActiveWord()
	if(Input.is_action_just_pressed("ui_text_backspace")):
		activeBox.text = ""

func chooseActiveWord():
	unHighlightBox()
	if(Input.is_action_just_pressed("ui_up") or Input.is_action_just_pressed("ui_down") or Input.is_action_just_released("click")):
		if(wordsIn.get(activeBox)[0]!=[]):
			activeWord = wordsIn.get(activeBox)[0]
		else:
			activeWord = wordsIn.get(activeBox)[1]
	if(Input.is_action_just_pressed("ui_left") or Input.is_action_just_pressed("ui_right") or Input.is_action_just_released("click")):
		if(wordsIn.get(activeBox)[1]!=[]):
			activeWord = wordsIn.get(activeBox)[1]
		else:
			activeWord = wordsIn.get(activeBox)[0]
	boxIndex = activeWord.find(activeBox)
	highlightBox()

func highlightBox():
	for letter in activeWord:
		if(letter!=activeBox):
			#letter.set("theme_override_colors/background_color",Color(Color.SKY_BLUE))
			letter.get_child(0).texture = blue
		else:
			#letter.set("theme_override_colors/background_color",Color(Color.GOLD))
			letter.get_child(0).texture = yellow

func unHighlightBox():
	for letter in activeWord:
		#letter.set("theme_override_colors/background_color",Color(Color.WHITE))
		letter.get_child(0).texture = white




