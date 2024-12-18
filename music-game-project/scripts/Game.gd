extends Node2D

const AL = preload("res://scenes/Move_ArrowLeft.tscn")
const AU = preload("res://scenes/Move_ArrowUp.tscn")
const AR = preload("res://scenes/Move_ArrowRight.tscn")

var random = 0
var RNG = RandomNumberGenerator.new()

@onready var pause_menu: Control = $"Pause menu"
var paused = false

func _process(delta: float) -> void:
	
	$Score/Label.text = str(Global.score)
	
func _on_Timer_timeout() -> void:
	
	$Timer.start()
	RNG.randomize()
	var random_int = RNG.randi_range(1,3) # or 1,4
	random = random_int
	
	# Random 1-3
	if random == 1:
		var al = AL.instantiate()
		get_parent().add_child(al)
		al.position = $Create/Marker2D_AL.global_position
		al.speed = randi_range(200,400)
		
	if random == 2:
		var au = AU.instantiate()
		get_parent().add_child(au)
		au.position = $Create/Marker2D_AU.global_position
		au.speed = randi_range(200,400)
	
	if random == 3:
		var ar = AR.instantiate()
		get_parent().add_child(ar)
		ar.position = $Create/Marker2D_AR.global_position
		ar.speed = randi_range(200,400)
