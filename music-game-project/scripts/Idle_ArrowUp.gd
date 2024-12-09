extends Area2D

@onready var animp = $AnimationPlayer
var sensor = 0
@onready var audio_player: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var audio_player_bad: AudioStreamPlayer2D = $AudioStreamPlayer2D2


func _process(delta: float) -> void:
	
	# Sensor and pressed "Good"
	if sensor == 1:
		if Input.is_action_just_pressed("Up"):
			animp.play("Good")
			Global.score += 10
			audio_player.play()
			await audio_player.finished
	
	# Sensor and pressed "Bad"
	if sensor == 0:
		if Input.is_action_just_pressed("Up"):
			animp.play("Bad")
			Global.score -= 10
			audio_player_bad.play()
			await  audio_player_bad.finished
	
func _on_Idle_ArrowUp_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	sensor = 1
	Global.sensor_AU = 1

func _on_Idle_ArrowUp_area_shape_exited(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	sensor = 0
	Global.sensor_AU = 0
