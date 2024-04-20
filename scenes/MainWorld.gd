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
	#animation
	var anim = $Smith
	var torch = $Torches
	torch.play("Idle")
	anim.play("idle")
	await get_tree().create_timer(1.5).timeout
	global.spawn = true
	var customer = customer1.instantiate()
	#where he spawns
	if  global.customercounter==3:
		customer.position = Vector2(3000,500)
	else:
		customer.position = Vector2(1700,500)
	add_child(customer)
	
	#Door sound Wuzard
	if  global.customercounter==1:
		$Wizdoor.play()
	#Door sound SMITHBRO
	if  global.customercounter==2:
		$Smithdoor.play()
	#door sound FISHMAN
	if  global.customercounter==3:
		$Fishdoor.play()
	
	
func _process(_delta):
	if  get_overlapping_bodies().size()>0:
		$GoPaint.show()
	else:
		$GoPaint.hide()

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
		$Nfloor21.hide()
		$Nfloor22.hide()
		$Nfloor23.hide()
		$Nfloor24.hide()
		$Nfloor25.hide()
		$Nfloor26.hide()
		$Nfloor27.hide()
		$Nfloor28.hide()
		$Nfloor29.hide()
		$Nfloor30.hide()
		$Nfloor31.hide()
		$FloorR.hide()
		$FloorR2.hide()
		$FloorR3.hide()
		$FloorR4.hide()
		$FloorR5.hide()
		$FloorR6.hide()
		$FloorR7.hide()
		$FloorR8.hide()
		$FloorR9.hide()
		$FloorR10.hide()
		$Panel.hide()
		$Panel2.hide()
		$Smith.hide()
		$Torches.hide()
		$GoPaint.hide()
		$Window.hide()
		$Window2.hide()
		$Sheild.hide()
		$Sheild2.hide()
		$Barrel.hide()
		$Barrel2.hide()
		$Barrel3.hide()
		$Barrel4.hide()
		$Pillar.hide()
		$Pillar2.hide()
		$Door.hide()
		

		global.drawing=true
		global.spawn=true
