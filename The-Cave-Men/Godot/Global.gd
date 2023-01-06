extends Node

var level = 1

func _unhandled_input(event):
	if event.is_action_pressed("quit"):
		get_tree().quit()
