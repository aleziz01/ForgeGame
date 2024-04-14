extends Node2D
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
			draw_circle(point,10, Color.RED)


