extends Area2D


var time_start = 0
var time_now = 0
onready var global = get_node("/root/Global")

func _ready():
	time_start = OS.get_unix_time()
	set_process(true)

const TIME_PERIOD = 3 # 500ms

var time = 0

func _process(delta):
	time += delta
	if time > TIME_PERIOD:
		emit_signal("timeout")
		# Reset timer
		time = 0

func _on_Area2D_body_entered(body):
	pass
