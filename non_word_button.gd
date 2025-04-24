extends Button

signal exploded
var explosionSound = load("res://word search assets/mixkit-epic-impact-afar-explosion-2782.wav")
@onready var sound = $explosionSound
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_pressed():
	print("Clear")
	$explosion.visible = true
	$explosion.play("explosion")
	sound.stream = explosionSound
	sound.play()
	$Timer.start(3)
	$".".text = ""
	$".".disabled = true
	exploded.emit()

func getType():
	return "non word"

func _on_timer_timeout():
	queue_free()
