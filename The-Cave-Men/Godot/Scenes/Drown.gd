extends CollisionShape2D


onready var timer = get_node("player/timer")



func _ready():
	pass # Replace with function body.



func on_area_body_enter(body):
	$bubbles.play()

func on_area_body_exit(body):
	$bubbles.stop()
