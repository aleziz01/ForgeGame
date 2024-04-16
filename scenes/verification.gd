extends Node2D

var recentscore=0 #this score
# Called when the node enters the scene tree for the first time.
func verif():
	
	global.totalscore+=recentscore

func _ready():
	var scoretext=global.totalscore
	print(scoretext)
	$ScoreShower.text=char(scoretext)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass
