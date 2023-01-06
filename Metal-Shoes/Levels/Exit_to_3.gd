extends Area2D


func _on_Exit_to_3_body_entered(body):
	if body.name == "Player":
		if name == "Exit_to_2":
			var _target = get_tree().change_scene("res://Levels/Layout Lvl 2.tscn")
		if name == "Exit_to_3":
			var _target = get_tree().change_scene("res://Levels/Layout Lvl 3.tscn")
		if name == "Exit_to_4":
			var _target = get_tree().change_scene("res://Levels/Game_Over.tscn")
