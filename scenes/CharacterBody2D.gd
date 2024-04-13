extends CharacterBody2D


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var simultaneous_scene = preload("res://scenes/drawing.tscn").instantiate

func _add_a_scene_manually():
	# This is like autoloading the scene, only
	# it happens after already loading the main scene.
	get_tree().root.add_child(simultaneous_scene)

func _physics_process(delta):


	# Handle jump.
	if Input.is_action_just_pressed("ui_accept"):
		_add_a_scene_manually()
	
