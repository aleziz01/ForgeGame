extends Control


# Called when the node enters the scene tree for the first time.
var simultaneous_scene = preload("res://scenes/drawing.tscn").instantiate

func _add_a_scene_manually():
	# This is like autoloading the scene, only
	# it happens after already loading the main scene.
	get_tree().root.add_child(simultaneous_scene)
	print(1)

func _ready():
	if Input.is_action_just_pressed("ui_accept"):
		print(1)
		_add_a_scene_manually()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
