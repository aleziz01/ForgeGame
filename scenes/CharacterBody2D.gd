extends CharacterBody2D


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var simultaneous_scene = preload("res://scenes/drawing.tscn").instantiate()

func _physics_process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene_to_file ("res://scenes/drawing.tscn")
		$Floor.hide()
		$Anvil.hide()
		$Wizard.hide()
