extends Node
var spawn = false
var drawing=false
var matrixdrawingplayer
var matrixcustomer
func _ready():
	matrixdrawingplayer = []
	for x in range(750):
		matrixdrawingplayer.append([])
		matrixdrawingplayer[x]=[]
		for y in range(750):
			matrixdrawingplayer[x].append([])
			matrixdrawingplayer[x][y]=0
	matrixcustomer = []
	for x in range(750):
		matrixcustomer.append([])
		matrixcustomer[x]=[]
		for y in range(750):
			matrixcustomer[x].append([])
			matrixcustomer[x][y]=0

# Called when the node enters the scene tree for the first time.
