extends Control

var paused = false


func _on_resume_pressed() -> void:
	get_tree().paused = false
	hide()


func _on_exit_pressed() -> void:
	get_tree().quit()


func _process(delta):
	if Input.is_action_just_pressed("pause"):
		pauseMenu()


func pauseMenu():
	if paused:
		hide()
		get_tree().paused = false
	else:
		show()
		get_tree().paused = true

	paused = !paused
