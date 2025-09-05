extends Node2D

var explosionSound = load("res://word search assets/mixkit-epic-impact-afar-explosion-2782.wav")
@onready var sound = $explosionSound

@onready var life1 = $life1
@onready var life2 = $life2
@onready var life3 = $life3
@onready var life4 = $life4
@onready var life5 = $life5
@onready var life6 = $life6
@onready var life7 = $life7
@onready var life8 = $life8
@onready var life9 = $life9
@onready var life10 = $life10


@onready var text = $Label

@onready var lives = [life1,life2,life3,life4,life5,life6,life7,life8,life9,life10]
@onready var activeLife = life1

@onready var music = $music
@onready var song = load("res://music/27 - mouth core.wav")

var nonWords = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	music.stream = song
	music.play()
	for child in $CrosswordBase.get_children():
		if(child.getType() == "non word"):
			nonWords+=1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	text.text = "Non-word letters remaining: " + str(nonWords)
	
	if(nonWords<=0):
		$win.visible = true
		$win.disabled = false
	
	if(len(lives)==0):
		$lose.visible = true
		$lose.disabled = false

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
		
	if($exit.visible):
		$exit/haha.visible = true

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
	$exit.visible = true
	$exit.disabled = false
	$exit/return.disabled = false


func _on_return_pressed():
	$exit.visible = false
	$exit/return.disabled = true
	$exit.disabled = true


func _on_exit_mouse_entered():
	$exit/Finger2.visible = true
	$exit/Bird1.visible = false


func _on_exit_mouse_exited():
	$exit/Finger2.visible = false
	$exit/Bird1.visible = true


func _on_win_pressed():
	get_tree().change_scene_to_file("res://menu.tscn")


func _on_lose_pressed():
	get_tree().reload_current_scene()


func _on_music_finished():
	music.play()
