extends Node2D
#THIS IS THE DRAWING SCENE 
var CirclePos: Array = []
var simultaneous_scene = preload("res://scenes/MainWorld.tscn")
func _on_exit_button_pressed():
	get_tree().change_scene_to_file ("res://scenes/MainWorld.tscn")
	global.drawing=false
var color=Color(0, 0, 0)

func _input(event: InputEvent):
	if  !Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		return
	else:
		
		CirclePos.append(event.position)
		queue_redraw()

func _on_yellow_pressed():
	color=Color(1,1,0)
func _on_black_pressed():
	color=Color(0,0,0)
func _on_green_pressed():
	color=Color(0,1,0)
func _on_blue_pressed():
	color=Color(0,0,1)
func _on_red_pressed():
	color=Color(1,0,0)
func _on_white_pressed():
	color=Color(1,1,1)

func _draw():
		for point in CirclePos:
			#draw_circle(point,10, Color.RED)
			var rect_pos = point  # Adjust position to define top-left corner
			var rect_size = Vector2(8, 8)  # Define rectangle size
			rect_pos.x=(int(rect_pos.x)/8)*8
			rect_pos.y=(int(rect_pos.y)/8)*8
			draw_rect(Rect2(rect_pos, rect_size), color)  # Draw rectangle
			







