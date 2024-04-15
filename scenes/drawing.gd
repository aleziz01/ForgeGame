extends Node2D
#THIS IS THE DRAWING SCENE 
var CirclePos: Array = []
var simultaneous_scene = preload("res://scenes/MainWorld.tscn")
func _on_exit_button_pressed():
	get_tree().change_scene_to_file ("res://scenes/MainWorld.tscn")
	global.drawing=false



func _input(event: InputEvent):
	if  !Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		pass
	else:
		CirclePos.append(event.position)
		queue_redraw()



func _draw():
		for point in CirclePos:
			#draw_circle(point,10, Color.RED)
			var rect_pos = point - Vector2(10, 10)  # Adjust position to define top-left corner
			var rect_size = Vector2(20, 20)  # Define rectangle size
			draw_rect(Rect2(rect_pos, rect_size), Color(1, 0, 0))  # Draw rectangle
