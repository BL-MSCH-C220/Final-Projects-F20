extends Control

onready var music = get_node("/root/Global/Music")

func _ready():
	pass


func _on_Start_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://cockpit/Cockpit.tscn")
	music.play()


func _on_Credits_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://menus/Credits.tscn")


func _on_Quit_pressed():
	get_tree().quit()
