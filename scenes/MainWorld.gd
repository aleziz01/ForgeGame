extends Area2D
#NOW WE ARE THE PLAYER CONTROL SCENE!!!!

var customer1 = preload("res://scenes/Customer1.tscn")
var simultaneous_scene = preload("res://scenes/drawing.tscn")

var customer = customer1.instantiate()

func _on_exit_pressed():
	get_tree().quit()

#spawning guys
func _ready():
	await get_tree().create_timer(1.5).timeout
	global.spawn = true
	var customer = customer1.instantiate()
	customer.position = Vector2(1000,500)
	add_child(customer)

func _on_go_paint_pressed():
	if get_overlapping_bodies().size()>0 and global.drawing==false and global.idle == true:
		get_tree().change_scene_to_file ("res://scenes/drawing.tscn")
		$Floor.hide()
		$Smith.hide()
		$GoPaint.hide()
		global.drawing=true
