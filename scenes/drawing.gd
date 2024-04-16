extends Node2D

# Arrays to store positions and colors of drawn pixels
var pixel_positions = []
var pixel_colors = []

# Variable to store the current color
var color = Color(0, 0, 0)  # Default color is black

func _input(event: InputEvent):
	if event is InputEventMouseButton:
		var mouse = event as InputEventMouseButton
		if mouse.button_index == MOUSE_BUTTON_LEFT:
			if mouse.pressed:

				var pos = get_global_mouse_position()
				pos.x = int(pos.x / 8) * 8  # Adjust x position to grid
				pos.y = int(pos.y / 8) * 8  # Adjust y position to grid
				pixel_positions.append(pos)
				# Add the current color to the pixel_colors array
				pixel_colors.append(color)
				queue_redraw()

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






