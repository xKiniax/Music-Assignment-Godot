extends Area2D

var speed = 300
var sensor = 0
var RNG = RandomNumberGenerator.new()
var random = 0

func _process(delta):
	
	# Move
	position.y -= speed * delta
	
	# Screen exit
	if position.y < -50:
		queue_free()
	
	# Sesnor and pressed
	if sensor == 1:
		# Add "Global" > new
		if Global.sensor_AL == 1:
			if Input.is_action_just_pressed("ui_left"):
				queue_free()


func _on_Move_ArrowLeft_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	sensor = 1

func _on_Move_ArrowLeft_area_shape_exited(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	sensor = 0
	
