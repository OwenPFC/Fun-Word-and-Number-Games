extends Node2D

var explosionSound = load("res://word search assets/mixkit-epic-impact-afar-explosion-2782.wav")
@onready var sound = $explosionSound

@onready var life1 = $life1
@onready var life2 = $life2
@onready var life3 = $life3

@onready var text = $Label

@onready var lives = [life1,life2,life3]
@onready var activeLife = life1

var nonWords = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	for child in $CrosswordBase.get_children():
		if(child.getType() == "non word"):
			nonWords+=1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	text.text = "Non-word letters remaining: " + str(nonWords)
	
	if(nonWords<=0):
		print("YESSSSSSS")
	
	if(len(lives)==0):
		print("LOOOOOOOL")

func loseLife():
	print("hello")
	if(len(lives) > 0):
		activeLife = lives[0]
		lives.remove_at(0)
		
		$explosion8.global_position.x = activeLife.global_position.x
		$explosion8.global_position.y = activeLife.global_position.y
		$explosion8.visible = true
		$explosion8.play("explosion")
		sound.stream = explosionSound
		sound.play()
		activeLife.visible = false

func _on_a_lose_life():
	loseLife()

func _on_d_lose_life():
	loseLife()

func _on_y_exploded():
	nonWords-=1


func _on_d_exploded():
	nonWords-=1


func _on_i_exploded():
	nonWords-=1


func _on_v_exploded():
	nonWords-=1

func _on_exit_pressed():
	get_tree().change_scene_to_file("res://menu.tscn")

func _on_quit_pressed():
	$quitScreen.visible = true
	$quitScreen/exit.disabled = false
	$quitScreen/return.disabled = false


func _on_return_pressed():
	$quitScreen.visible = false
	$quitScreen/exit.disabled = true
	$quitScreen/return.disabled = true
