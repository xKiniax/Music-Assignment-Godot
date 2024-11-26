extends Area2D

var speed = 100


func _process(delta):
	
	# Move
	position.y -= speed * delta
	
	# Screen exit
	if position.y < -50:
		queue_free()
		print("RIP")
