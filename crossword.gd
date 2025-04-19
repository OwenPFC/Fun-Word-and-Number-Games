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

var word1 = [a,b,c,d]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _unhandled_input(event):
	if event is InputEventKey:
		$a.text = event.as_text_keycode()
	
	
