extends Area2D

@onready var animp = $AnimationPlayer
var sensor = 0


func _process(delta: float) -> void:
	
	# Sensor and pressed "Good"
	if sensor == 1:
		if Input.is_action_just_pressed("ui_up"):
			animp.play("Good")
	
	# Sensor and pressed "Bad"
	if sensor == 0:
		if Input.is_action_just_pressed("ui_up"):
			
			animp.play("Bad")
	
func _on_Idle_ArrowUp_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	sensor = 1
	Global.sensor_AL = 1

func _on_Idle_ArrowUp_area_shape_exited(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	sensor = 0
	Global.sensor_AL = 0
