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
	pastposition.clear()
	pastcolor.clear()


var pastposition = []
var pastcolor = []
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
	if ButtonPressed and pos.x<210 and pos.y<210 and pos.y>10 and pos.x>10: #makes the canvas that the player will draw in and doesnt let draw outside of it
		for i in range(pixel_positions.size()): # verifies if the same position has been crossed and if it was the same color
			if(pastposition[i]==pos and pastcolor[i]==color):#then it isnt ok so it doesnt register it again since the pixel was already colored
				ok=false
		if ok==true:#if its ok it registers the position and everything is normal
			pixel_positions.append(pos)
			# Add the current color to the pixel_colors array
			pixel_colors.append(color)
			pastposition.append(pos)
			pastcolor.append(color)
			queue_redraw()
		ok=true
		

# Color change functions
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
func _on_white_pressed():
	color = Color(1, 1, 1)  
func _on_clear_pressed():
	pixel_positions.clear()
	pixel_colors.clear()
	pastposition.clear()
	pastcolor.clear()
	queue_redraw()
func _on_next_pressed():
	nextpressed+=1
	if(nextpressed==3):
		get_tree().change_scene_to_file ("res://scenes/verification.tscn")
		global.drawing=false
# Drawing function
func _draw():
	# Iterate over each drawn pixel
	for i in range(pixel_positions.size()):
		# Get the position and color of the pixel
		var pos = pixel_positions[i]
		var col = pixel_colors[i]
		var rect_pos = pos
		# Draw a rectangle at the pixel's position with its color
		draw_rect(Rect2(pos, Vector2(8, 8)), col)











