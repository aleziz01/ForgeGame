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
	#if you change this it will change how much he goes
	if  global.customercounter==3:
		if position.x <= StartPos - 2600:
		
			global.idle = true
			global.spawn = false
	else:
		if position.x <= StartPos - 1300:
		
			global.idle = true
			global.spawn = false
func talk():
	var textbox=textbox1.instantiate()
	if(global.idle==true):
		add_child(textbox)
		if(global.customercounter==1): #wizard guy
			textbox.text="I am the famous Gerwin Grindelbord, you must have heard of me. I am looking for your magnum opus. A sword so powerful it can slay my wife, she has gone mad and has stopped making my favorite schnitzles. For this, my blade must include a tinge of blue on the blade and a green gem on the hilt it must also be SHARP."
			global.wantedcolorhilt=Color(0,1,0) #green
			global.wantedcolorhandle=Color(0.85,0,0)
			global.wantedcolorblade=Color(0,0,1) #blue
			global.wantedcoloramountblade=1 #-1 is none 0 is not specified(>1 pixel) 1 is a bit 2 is some 3 is a good amount 4 is a lot
			global.wantedcoloramounthilt=4 #-1 is none 0 is not specified(>1 pixel) 1 is a bit 2 is some 3 is a good amount 4 is a lot
			global.wantedcoloramounthandle=-1 #-1 is none 0 is not specified(>1 pixel) 1 is a bit 2 is some 3 is a good amount 4 is a lot
			global.wantedsharpnesshandle=1 #0 is none 1 is sharp 2 is dull
		if(global.customercounter==2): #fridge guy
			textbox.text="I hear your blacksmithery aint too bad. I too hail from the blacksmithian race, show me the best you can do I want a sword as sharp my fathers backpain, and as deadly as his belt. Make sure it includes blue on the handle and gray on the hilt. "
			global.wantedcolorhilt=Color(0.85,0,0) 
			global.wantedcolorhandle=Color(0,0,1) #blue
			global.wantedcolorblade=Color(0.5,0.5,0.5) #gray 
			global.wantedcoloramountblade=0
			global.wantedcoloramounthilt=-1
			global.wantedcoloramounthandle=0
			global.wantedsharpnesshandle=1
		if(global.customercounter==3): #rival blacksmith guy
			textbox.text="you must be asking yourself? Why have I grown so large? Why am I *inside* your floor? Well, I have no time for these silly questions make me a blunt GRAY sword so I can dig myself out of this situation."
			global.wantedcolorhilt=Color(0.5,0.5,0.5) #grey
			global.wantedcolorhandle=Color(0.5,0.5,0.5) #grey
			global.wantedcolorblade=Color(0.5,0.5,0.5) #grey
			global.wantedcoloramountblade=2 
			global.wantedcoloramounthilt=0
			global.wantedcoloramounthandle=3
			global.wantedsharpnesshandle=2 #dull

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
		anim.play("SmithBro")
	elif global.customercounter==2:
		CurrentState = idle
		var anim = $customer
		anim.play("SmithIdle")
	if global.drawing==true:
		position=Vector2(5000,5000)
		
		#Third customer / FISH MAN???

	if global.spawn == true and global.customercounter==3:
		CurrentState = moving
		var anim = $customer
		anim.play("FishRun")
	elif global.customercounter==3:
		CurrentState = idle
		var anim = $customer
		anim.play("FishIdle")
	if global.drawing==true:
		position=Vector2(5000,5000)

