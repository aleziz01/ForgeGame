extends Node2D

var recentscore=0 #this score
# Called when the node enters the scene tree for the first time.
func score():
	
	global.totalscore+=recentscore

func _ready():
	var scoretext=global.qualityblade
	print(global.qualityblade)
	print(scoretext)
	$ScoreShower.text = str(scoretext)
	queue_redraw()

func _on_next_pressed():
	get_tree().change_scene_to_file ("res://scenes/MainWorld.tscn")
	global.drawing=false
	global.pastposition.clear()
	global.pastcolor.clear()

func _draw():
	# Iterate over each drawn pixel
	for i in range(global.pastposition.size()):
		# Get the position and color of the pixel
		var pos = global.pastposition[i]
		var col = global.pastcolor[i]
		# Draw a rectangle at the pixel's position with its color
		draw_rect(Rect2(pos, Vector2(8, 8)), col)

func verify():
	
	pass


