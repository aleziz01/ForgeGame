extends Area2D
#NOW WE ARE THE PLAYER CONTROL SCENE!!!!

var customer1 = preload("res://Customer1.tscn")
var simultaneous_scene = preload("res://scenes/drawing.tscn")

var customer = customer1.instantiate()

#spawning guys
func _physics_process(delta):
	if Input.is_action_just_pressed("spawn"):
		global.spawn = true
		var customer = customer1.instantiate()
		customer.position = Vector2(1000,500)
		add_child(customer)
	
 
#swapping to the drawing room
	if Input.is_action_just_pressed("ui_accept") and get_overlapping_bodies().size()>0 and global.drawing==false:
		get_tree().change_scene_to_file ("res://scenes/drawing.tscn")
		$Floor.hide()
		$Smith.hide()
		global.drawing=true
		
		
