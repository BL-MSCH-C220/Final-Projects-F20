extends Control

func _ready():
	pass 
	
func _on_Button_pressed():
	get_tree().change_scene("res://Screens/SceneTransitions/SceneChange1.tscn")



func _on_Button2_pressed():
	get_tree().quit()
