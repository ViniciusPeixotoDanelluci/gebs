extends Timer


func _input(event):
	if event.is_action_pressed("stop_demo"):
		if is_stopped():
			start()
		else:
			stop()


func _timeout():
	pass
#	start()
