extends CharacterBody2D
#THIS IS THE CUSTOMER SCENE 

var StartPos
var CurrentState= idle
const speed = 400
var dir = Vector2.LEFT
var textbox1 = preload("res://scenes/textbox1.tscn")
enum {
	idle,
	moving,
}

func _ready():
	StartPos = position.x 
	print(position)
		

func move(delta):
	position += dir*speed*delta
	if position.x <= StartPos - 900:
		print("STOP")
		
		global.idle = true
		global.spawn = false
func talk():
	var textbox=textbox1.instantiate()
	if(global.idle==true):
		add_child(textbox)
		if(global.customercounter==1): #wizard guy
			textbox.text="My name is Gerwin! I hail from the magical forest in AliKhabar! I would like a maaagiiiicaaallll sword!!!(a tinge of blue on the blade and a magical amount of green on the hilt)"
			global.wantedcolorhilt=Color(0,1,0) #green
			global.wantedcolorhandle=Color(0.85,0,0)
			global.wantedcolorblade=Color(0,0,1) #blue
			global.wantedcoloramountblade=1 #-1 is none 0 is not specified(>1 pixel) 1 is a bit 2 is some 3 is a good amount 4 is a lot
			global.wantedcoloramounthilt=4 #-1 is none 0 is not specified(>1 pixel) 1 is a bit 2 is some 3 is a good amount 4 is a lot
			global.wantedcoloramounthandle=-1 #-1 is none 0 is not specified(>1 pixel) 1 is a bit 2 is some 3 is a good amount 4 is a lot
			global.wantedsharpnesshandle=0 #0 is none 1 is sharp 2 is dull
		if(global.customercounter==2): #fridge guy
			textbox.text="me bob, give bob sword, make gray blade and blue handle which is sharp please"
			global.wantedcolorhilt=Color(0.85,0,0) 
			global.wantedcolorhandle=Color(0,0,1) #blue
			global.wantedcolorblade=Color(0.5,0.5,0.5) #gray 
			global.wantedcoloramountblade=0
			global.wantedcoloramounthilt=-1
			global.wantedcoloramounthandle=0
			global.wantedsharpnesshandle=1
		if(global.customercounter==3): #rival blacksmith guy
			textbox.text="Hmph, hmph, hmph, a fellow blacksmith i see! Let's see what you've got. Give me a sword which has a sharp handle with a diamond at its base, a hilt decorated with blue and a blade tainted by blood"
			global.wantedcolorhilt=Color(0,0,1) #green
			global.wantedcolorhandle=Color(0.129, 0.855, 0.922) #light blue
			global.wantedcolorblade=Color(1,0,0) #red
			global.wantedcoloramountblade=2 
			global.wantedcoloramounthilt=0
			global.wantedcoloramounthandle=3
			global.wantedsharpnesshandle=1 

func _process(delta):
	match CurrentState:
			idle:
				talk()
			moving:
				move(delta)
		

	position.y = 500
	#first customer/ WIZARD
	if global.spawn == true and global.customercounter==1:
		CurrentState = moving
		var anim = $customer
		anim.play("ShuffleLeft")
	elif global.customercounter==1: 
		CurrentState = idle
		var anim = $customer
		anim.play("Still")
	
	#Second customer / SMITHS BROTHER?
	
	
	if global.spawn == true and global.customercounter==2:
		CurrentState = moving
		var anim = $customer
		anim.play("SmithIdle")
	elif global.customercounter==2:
		CurrentState = idle
		var anim = $customer
		anim.play("SmithIdle")
	if global.drawing==true:
		position=Vector2(5000,5000)

