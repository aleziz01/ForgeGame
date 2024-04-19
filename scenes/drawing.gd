extends Node2D

# Arrays to store positions and colors of drawn pixels
var pixel_positions = []
var pixel_colors = []
var nextpressed = 0
# Variable to store the current color
var color = Color(0, 0, 0)  # Default color is black
var ButtonPressed=false

func _on_exit_button_pressed():
	get_tree().change_scene_to_file ("res://scenes/MainWorld.tscn")
	global.drawing=false
	pixel_positions.clear()
	pixel_colors.clear()

#func _ready():
	#$Frame.hide()
	#$Frame2.hide()
	#$Frame3.hide()


func _input(event: InputEvent):
	var pos = get_global_mouse_position()
	var ok=true
	pos.x = int(pos.x / 8) * 8  # Adjust x position to grid
	pos.y = int(pos.y / 8) * 8  # Adjust y position to grid
	if event is InputEventMouseButton:
		var mouse = event as InputEventMouseButton
		if mouse.button_index == MOUSE_BUTTON_LEFT:
			if mouse.pressed:
				ButtonPressed = true
			else:
				ButtonPressed = false

#this is for the the first scene 
	if ButtonPressed==true and nextpressed==0 and pos.x<860 and pos.y<800 and pos.y>540 and pos.x>640:
	
		  #makes the canvas that the player will draw in and doesnt let draw outside of it
		for i in range(pixel_positions.size()): # verifies if the same position has been crossed and if it was the same color
			if(global.pastposition[i]==pos and global.pastcolor[i]==color):#then it isnt ok so it doesnt register it again since the pixel was already colored
				ok=false
				break
		if ok==true:#if its ok it registers the position and everything is normal
			pixel_positions.append(pos)
			# Add the current color to the pixel_colors array
			pixel_colors.append(color)
			global.pastposition.append(pos)
			global.pastcolor.append(color)
			queue_redraw()
		ok=true


#this is for the the second scene 
	if ButtonPressed==true and nextpressed==1 and pos.x<1060 and pos.y<539 and pos.y>339 and pos.x>440:
	
		  #makes the canvas that the player will draw in and doesnt let draw outside of it
		for i in range(pixel_positions.size()): # verifies if the same position has been crossed and if it was the same color
			if(global.pastposition[i]==pos and global.pastcolor[i]==color):#then it isnt ok so it doesnt register it again since the pixel was already colored
				ok=false
				break
		if ok==true:#if its ok it registers the position and everything is normal
			pixel_positions.append(pos)
			# Add the current color to the pixel_colors array
			pixel_colors.append(color)
			global.pastposition.append(pos)
			global.pastcolor.append(color)
			queue_redraw()
		ok=true


#this is for the the third scene 
	if ButtonPressed==true and nextpressed==2 and pos.x<940 and pos.y<339 and pos.y>-200 and pos.x>540:
	
		  #makes the canvas that the player will draw in and doesnt let draw outside of it
		for i in range(pixel_positions.size()): # verifies if the same position has been crossed and if it was the same color
			if(global.pastposition[i]==pos and global.pastcolor[i]==color):#then it isnt ok so it doesnt register it again since the pixel was already colored
				ok=false
				break
		if ok==true:#if its ok it registers the position and everything is normal
			pixel_positions.append(pos)
			# Add the current color to the pixel_colors array
			pixel_colors.append(color)
			global.pastposition.append(pos)
			global.pastcolor.append(color)
			queue_redraw()
		ok=true

		

# Color change functions, to make a button and link it to the script look for a 4 minute signal tutorial
func _on_yellow_pressed():
	color = Color(1, 1, 0)
func _on_black_pressed():
	color = Color(0, 0, 0)
func _on_green_pressed():
	color = Color(0, 1, 0)
func _on_blue_pressed():
	color = Color(0, 0, 1)
func _on_red_pressed():
	color = Color(1, 0, 0)
func _on_eraser_pressed():
	color = Color(1, 1, 1)
func _on_gray_pressed():
	color = Color(0.5,0.5,0.5)
func _on_light_blue_pressed():
	color = Color(0.129, 0.855, 0.922)
func _on_brown_pressed():
	color = Color(0.541, 0.286, 0.031)

func _on_clear_pressed():
	pixel_positions.clear()
	pixel_colors.clear()
	queue_redraw()
#next peice 
func _on_next_pressed():
	var swapped 
		#this is for the GUI
	
	
	if(nextpressed==0): #handle positions and colors
		for i in pixel_positions.size()-1:  #bubblesort from which sorts it from smallest y position to biggest
			swapped=false
			for j in pixel_positions.size()-i-1:
				if pixel_positions[j].y > pixel_positions[j+1].y:
					var position_=pixel_positions[j+1]
					var color=pixel_colors[j+1]
					pixel_positions[j+1] = pixel_positions[j]
					pixel_colors[j+1]=pixel_colors[j]
					pixel_colors[j]=color
					pixel_positions[j]=position_
					swapped=true
			if swapped==false:
				break
		var colorcounter=0
		var sharpnesscounter=0
		global.bladesharpnessmax=false
		for i in pixel_positions.size(): #checks how much of the color that the customer wanted exists in the blade
			if pixel_colors[i]==global.wantedcolorhandle:
				colorcounter+=1
		for i in pixel_positions.size()-1: #checks how sharp the blade is
			if pixel_positions[i].y<pixel_positions[i+1].y and pixel_positions[i].x!=pixel_positions[i+1].x:
				sharpnesscounter+=1
			if sharpnesscounter>14 and global.wantedsharpnesshandle==1:
				global.qualityhandle=70
				global.bladesharpnessmax=true
				break
			elif sharpnesscounter>14 and global.wantedsharpnesshandle==2:
				global.qualityhandle=0
				global.bladesharpnessmax=true
				break
		if(global.bladesharpnessmax==false and global.wantedsharpnesshandle==1):
			global.qualityhandle=sharpnesscounter*5
		elif(global.bladesharpnessmax==false and global.wantedsharpnesshandle==2):
			global.qualityhandle=70-sharpnesscounter*5
		if(global.wantedsharpnesshandle==0):
			global.qualityhandle=70
		if(colorcounter<=7 and global.wantedcoloramounthandle==1):#if the customer wants a bit of the specified color on the blade
			global.qualityhandle+=30
		if(colorcounter<=15 and colorcounter>=8 and global.wantedcoloramounthandle==2): #if the customer wants some specified color on the blade
			global.qualityhandle+=30
		if(colorcounter<=40 and colorcounter>=16 and global.wantedcoloramounthandle==3):#if the customer wants a good amount of the specified color on the blade
			global.qualityhandle+=30
		if(colorcounter>=40 and global.wantedcoloramounthandle==4): #if the customer wants a lot of the specified color on the blade
			global.qualityhandle+=30
		if(global.wantedcoloramounthandle==0): #if the customer doesnt specify the amount of color or the color
			global.qualityhandle+=30
		#for i in pixel_positions.size():
			
	if(nextpressed==1): #hilt positions and colors
		for i in pixel_positions.size()-1:  #bubblesort from which sorts it from smallest x position to biggest
			swapped=false
			for j in pixel_positions.size()-i-1:
				if pixel_positions[j].x > pixel_positions[j+1].x:
					var position_=pixel_positions[j+1]
					var color=pixel_colors[j+1]
					pixel_positions[j+1] = pixel_positions[j]
					pixel_colors[j+1]=pixel_colors[j]
					pixel_colors[j]=color
					pixel_positions[j]=position_
					swapped=true
			if swapped==false:
				break
		var colorcounter=0
		var sharpnesscounter=0
		global.bladesharpnessmax=false
		for i in pixel_positions.size(): #checks how much of the color that the customer wanted exists in the blade
			if pixel_colors[i]==global.wantedcolorhilt:
				colorcounter+=1
		for i in pixel_positions.size()-1: #checks how sharp the blade is
			if pixel_positions[i].y!=pixel_positions[i+1].y and pixel_positions[i].x!=pixel_positions[i+1].x:
				sharpnesscounter+=1
			if sharpnesscounter>14:
				global.qualityhilt=70
				global.bladesharpnessmax=true
				break
		if(global.bladesharpnessmax==false):
			global.qualityhilt=sharpnesscounter*5
		if(colorcounter<=7 and global.wantedcoloramounthilt==1):#if the customer wants a bit of the specified color on the blade
			global.qualityhilt+=30
		if(colorcounter<=15 and colorcounter>=8 and global.wantedcoloramounthilt==2): #if the customer wants some specified color on the blade
			global.qualityhilt+=30
		if(colorcounter<=40 and colorcounter>=16 and global.wantedcoloramounthilt==3):#if the customer wants a good amount of the specified color on the blade
			global.qualityhilt+=30
		if(colorcounter>=40 and global.wantedcoloramounthilt==4): #if the customer wants a lot of the specified color on the blade
			global.qualityhilt+=30
		if(global.wantedcoloramounthilt==0): #if the customer doesnt specify the amount of color or the color
			global.qualityhilt+=30
	if(nextpressed==2): #blade positions and colors and quality verification screen
		for i in pixel_positions.size()-1: #bubblesort from which sorts it from biggest y position to smallest
			swapped=false
			for j in pixel_positions.size()-i-1:
				if pixel_positions[j].y < pixel_positions[j+1].y:
					var position_=pixel_positions[j+1]
					var color=pixel_colors[j+1]
					pixel_positions[j+1] = pixel_positions[j]
					pixel_colors[j+1]=pixel_colors[j]
					pixel_colors[j]=color
					pixel_positions[j]=position_
					swapped=true
			if swapped==false:
				break
		var colorcounter=0
		var sharpnesscounter=0
		global.bladesharpnessmax=false
		for i in pixel_positions.size(): #checks how much of the color that the customer wanted exists in the blade
			if pixel_colors[i]==global.wantedcolorblade:
				colorcounter+=1
		for i in pixel_positions.size()-1: #checks how sharp the blade is
			if pixel_positions[i].y!=pixel_positions[i+1].y and pixel_positions[i].x!=pixel_positions[i+1].x:
				sharpnesscounter+=1
			if sharpnesscounter>14:
				global.qualityblade=70
				global.bladesharpnessmax=true
				break
		if(global.bladesharpnessmax==false):
			global.qualityblade=sharpnesscounter*5
		if(colorcounter<=7 and global.wantedcoloramountblade==1):#if the customer wants a bit of the specified color on the blade
			global.qualityblade+=30
		if(colorcounter<=15 and colorcounter>=8 and global.wantedcoloramountblade==2): #if the customer wants some specified color on the blade
			global.qualityblade+=30
		if(colorcounter<=40 and colorcounter>=16 and global.wantedcoloramountblade==3):#if the customer wants a good amount of the specified color on the blade
			global.qualityblade+=30
		if(colorcounter>=40 and global.wantedcoloramountblade==4): #if the customer wants a lot of the specified color on the blade
			global.qualityblade+=30
		if(global.wantedcoloramountblade==0): #if the customer doesnt specify the amount of color or the color
			global.qualityblade+=30
		pixel_positions.clear()
		pixel_colors.clear()
		queue_redraw()
		get_tree().change_scene_to_file ("res://scenes/verification.tscn")
	nextpressed+=1
	pixel_positions.clear()
	pixel_colors.clear()
	queue_redraw()
	
	

func _process(delta):
	if nextpressed == 0:
		$Frame.show()

	else:
		$Frame.hide() 

	if nextpressed == 1:
		$Frame2.show()

	else:
		$Frame2.hide()

	if nextpressed == 2:
		$Frame3.show()
	else:
		$Frame3.hide()
 

# Drawing function
func _draw():
	# Iterate over each drawn pixel
	for i in range(pixel_positions.size()):
		# Get the position and color of the pixel
		var pos = pixel_positions[i]
		var col = pixel_colors[i]
		# Draw a rectangle at the pixel's position with its color
		draw_rect(Rect2(pos, Vector2(8, 8)), col)









