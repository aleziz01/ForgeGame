extends Node2D
var CirclePos: Array = []

func _input(event: InputEvent)->void:
	if  !Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		return
		
	CirclePos.append(event.position)
	queue_redraw()
func _draw() ->void:
		for point in CirclePos:
			draw_circle(point,10, Color.RED)
	
