extends CharacterBody2D
#@onready var animation = $AnimationPlayer
var StartPos
var CurrentState= idle
const speed = 80
var dir = Vector2.LEFT

enum {
	idle,
	moving,
}

func _ready():
	StartPos = position.x 

func move(delta):
	position += dir*speed*delta
	if position.x <= StartPos - 600:
		print("STOP")
		global.spawn = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	match CurrentState:
			idle:
				pass
			moving:
				move(delta)

	position.y = 500
	if global.spawn == true:
		CurrentState = moving
		#animation.play("shuffling")
	else: 
		CurrentState = idle


	

