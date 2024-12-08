extends Node2D

const AL = preload("res://scenes/Move_ArrowLeft.tscn")
const AU = preload("res://scenes/Move_ArrowUp.tscn")
const AR = preload("res://scenes/Move_ArrowRight.tscn")

var random = 0
var RNG = RandomNumberGenerator.new()
var spawn_1_beat = 0
var spawn_2_beat = 0
var spawn_3_beat = 1
var spawn_4_beat = 0

var bpm = 115
var song_position = 0.0
var song_position_in_beats = 0
var last_spawned_beat = 0
var sec_per_beat = 60.0 / bpm

var bad = 0
var good = 0

func _ready() -> void:
	randomize()
	$Conductor.play_with_beat_offset(8)

func _process(delta: float) -> void:
	
	$Score/Label.text = str(Global.score)
	
func _on_Conductor_beat(position):
	song_position_in_beats = position
	if song_position_in_beats > 36:
		spawn_1_beat = 1
		spawn_2_beat = 1
		spawn_3_beat = 1
		spawn_4_beat = 1
	if song_position_in_beats > 98:
		spawn_1_beat = 2
		spawn_2_beat = 0
		spawn_3_beat = 1
		spawn_4_beat = 0
	if song_position_in_beats > 132:
		spawn_1_beat = 0
		spawn_2_beat = 2
		spawn_3_beat = 0
		spawn_4_beat = 2
	if song_position_in_beats > 162:
		spawn_1_beat = 2
		spawn_2_beat = 2
		spawn_3_beat = 1
		spawn_4_beat = 1
	if song_position_in_beats > 194:
		spawn_1_beat = 2
		spawn_2_beat = 2
		spawn_3_beat = 1
		spawn_4_beat = 2
	if song_position_in_beats > 228:
		spawn_1_beat = 0
		spawn_2_beat = 2
		spawn_3_beat = 1
		spawn_4_beat = 2
	if song_position_in_beats > 258:
		spawn_1_beat = 1
		spawn_2_beat = 2
		spawn_3_beat = 1
		spawn_4_beat = 2
	if song_position_in_beats > 288:
		spawn_1_beat = 0
		spawn_2_beat = 2
		spawn_3_beat = 0
		spawn_4_beat = 2
	if song_position_in_beats > 322:
		spawn_1_beat = 3
		spawn_2_beat = 2
		spawn_3_beat = 2
		spawn_4_beat = 1
	if song_position_in_beats > 388:
		spawn_1_beat = 1
		spawn_2_beat = 0
		spawn_3_beat = 0
		spawn_4_beat = 0
	if song_position_in_beats > 396:
		spawn_1_beat = 0
		spawn_2_beat = 0
		spawn_3_beat = 0
		spawn_4_beat = 0
	if song_position_in_beats > 404:
		#Global.set_score(score)
		Global.good = good
		Global.bad = bad
		
func _spawn_notes(to_spawn):
	if to_spawn > 0:
		lane = randi() % 3
		instance = note.instance()
		instance.initialize(lane)
		add_child(instance)
	if to_spawn > 1:
		while rand == lane:
			rand = randi() % 3
		lane = rand
		instance = note.instance()
		instance.initialize(lane)
		add_child(instance)
	
#func _on_Timer_timeout() -> void:
	
	$Timer.start()
	RNG.randomize()
	var random_int = RNG.randi_range(0,3) # or 1,4
	random = random_int
	
	# Random 1-3
	if random == 1:
		var al = AL.instantiate()
		get_parent().add_child(al)
		al.position = $Create/Marker2D_AL.global_position
		
	if random == 2:
		var au = AU.instantiate()
		get_parent().add_child(au)
		au.position = $Create/Marker2D_AU.global_position
		
	if random == 3:
		var ar = AR.instantiate()
		get_parent().add_child(ar)
		ar.position = $Create/Marker2D_AR.global_position
