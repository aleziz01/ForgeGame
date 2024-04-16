extends Control

var settings_file = ConfigFile.new()

var vsync: int = 0

var audio: Vector3 = Vector3(70.0, 70.0, 70.0)

@onready var main_container = get_node("%MainContainer")

var simultaneous_scene = preload("res://scenes/MainWorld.tscn").instantiate()
func _add_a_scene_manually():
	# This is like autoloading the scene, only
	# it happens after already loading the main scene.
	get_tree().root.add_child(simultaneous_scene)

func _first_time():
	DisplayServer.window_set_size(DisplayServer.screen_get_size())
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_MAXIMIZED)
	DisplayServer.window_set_vsync_mode(vsync)
	# -- Video
	settings_file.set_value("VIDEO", "vsync", vsync)
	# -- audio
	settings_file.set_value("audio", "General", audio.x)
	settings_file.set_value("audio", "Music", audio.y)
	settings_file.set_value("audio", "SFX", audio.z)
	settings_file.save("res://settings.cfg")

func _on_start_button_pressed():
	# Put your load scene here
	# Check the documentation https://docs.godotengine.org/en/stable/tutorials/scripting/change_scenes_manually.html
	#remove_child($MainMusic)
	_add_a_scene_manually()
	get_node("/root/MAIN").queue_free()
	pass  # Replace with function body.

func _on_exit_button_pressed():
	get_tree().quit()

