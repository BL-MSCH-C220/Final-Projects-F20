extends Area2D

onready var global = get_node("/root/Global")

func _ready():
	pass
	
	


func _on_Area2D_body_entered(body):
	if body.name == "Player":
		if name == "Portal_to_2":
			Global.level = 2
			get_tree().change_scene("res://Scenes/Level2.tscn")
		if name == "Portal_to_3":
			Global.level = 3
			get_tree().change_scene("res://Scenes/Level3.tscn")
		if name == "End_Portal":
			Global.level = 4
			get_tree().change_scene("res://Scenes/Game_Over.tscn")
