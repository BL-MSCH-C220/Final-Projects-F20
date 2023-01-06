extends Node

onready var SM = get_parent()
onready var player = get_node("../..")

var hitbox = 0

func start():
	player.set_animation("Attacking")
	$Timer.start()
	hitbox = 1

func _physics_process(_delta):
	if Input.is_action_just_pressed("attack"):
		start()




func _on_Area2D_body_entered(body):
	if not body.name == "Ground" :
		if hitbox == 1:
			body.queue_free()
		if hitbox == 0:
			pass


func _on_Timer_timeout():
	hitbox = 0
