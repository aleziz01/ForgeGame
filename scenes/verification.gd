extends Node2D

# Called when the node enters the scene tree for the first time.

var recentscore=(global.qualityblade+global.qualityhilt+global.qualityhandle)/3
func _ready():
	if(global.customercounter==3):
		if global.totalscore>150:
			$ScoreShower.text = "the total score is "+str(global.totalscore)+"/300, you get to live another day!"
		else:
			$ScoreShower.text = "the total score is "+str(global.totalscore)+"/300, your execution is tommorow at 5PM, see you there!"
		$next.hide()
	else:
		$ScoreShower.text = "your score is "+str(recentscore)
	queue_redraw()

func _on_next_pressed():
	get_tree().change_scene_to_file ("res://scenes/MainWorld.tscn")
	global.totalscore+=recentscore
	global.drawing=false
	global.pastposition.clear()
	global.pastcolor.clear()
	global.qualityblade=0
	global.qualityhandle=0
	global.qualityhilt=0
	global.customercounter+=1
	global.idle=false

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


