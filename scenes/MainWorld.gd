extends Area2D
#NOW WE ARE THE PLAYER CONTROL SCENE!!!!

var customer1 = preload("res://scenes/Customer1.tscn")
var simultaneous_scene = preload("res://scenes/drawing.tscn")

var customer = customer1.instantiate()

func _on_exit_pressed():
	get_tree().quit()

#spawning guys
func _ready():
	$GoPaint.hide()
	var anim = $Smith
	anim.play("idle")
	await get_tree().create_timer(1.5).timeout
	global.spawn = true
	var customer = customer1.instantiate()
	customer.position = Vector2(1300,500)
	add_child(customer)
	
	
func _process(delta):
	if global.idle == true:
		$GoPaint.show()

func _on_go_paint_pressed():
	if get_overlapping_bodies().size()>0 and global.drawing==false and global.idle == true:
		get_tree().change_scene_to_file ("res://scenes/drawing.tscn")
		$Nfloor.hide()
		$Nfloor2.hide()
		$Nfloor3.hide()
		$Nfloor4.hide()
		$Nfloor5.hide()
		$Nfloor6.hide()
		$Nfloor7.hide()
		$Nfloor8.hide()
		$Nfloor9.hide()
		$Nfloor10.hide()
		$Nfloor11.hide()
		$Nfloor12.hide()
		$Nfloor13.hide()
		$Nfloor14.hide()
		$Nfloor15.hide()
		$Nfloor16.hide()
		$Nfloor17.hide()
		$Nfloor18.hide()
		$Nfloor19.hide()
		$Nfloor20.hide()
		$Smith.hide()
		$GoPaint.hide()
		global.drawing=true
		global.spawn=true
