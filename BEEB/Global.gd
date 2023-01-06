extends Node

onready var timer = get_node("/root/Game/UI/Timer")

func _ready():
	Global.timer = 15
	Global.update_timer()
	get_node("/root/Game/UI/Timer").start()

func update_timer():
	var t_m = floor(timer / 60)
	var t_s = timer % 60
	var t = "Time: %02d" % t_m
	t += ":%02d" % t_s
	get_node("/root/Game/UI/HUD/Time").text = t
