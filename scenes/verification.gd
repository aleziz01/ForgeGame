extends Node2D

var recentscore=0 #this score
# Called when the node enters the scene tree for the first time.
func score():
	
	global.totalscore+=recentscore

func _ready():
	var scoretext=global.totalscore
	print(scoretext)
	$ScoreShower.text = str(scoretext)


func verify():
	
	pass
