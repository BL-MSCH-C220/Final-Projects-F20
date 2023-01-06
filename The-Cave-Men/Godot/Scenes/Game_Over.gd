extends Control

func _on_Play_Again_pressed():
	get_tree().change_scene("res://Scenes/Level1.tscn")


func _on_Quit_pressed():
	get_tree().quit()
