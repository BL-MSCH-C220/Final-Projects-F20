extends KinematicBody2D

var velocity = Vector2.ZERO

var down = 10

var forward = 1

export var gravity = Vector2(0,30)

func _ready():
	pass # Replace with function body.



func _physics_process(_delta):
	position.x -= forward
	position.y += down


func _on_Area2D_body_entered(body):
	if body.name == "Ground":
		down = 0
	if body.name == "Player":
		body.die()



func _on_Area2D_body_exited(body):
	if body.name == "Ground":
		down = 10


func _on_Area2D2_body_entered(body):
	if body.name == "Ground":
		if forward == 1:
			forward = -1
			$AnimatedSprite.flip_h = true
		else:
			forward = 1
			$AnimatedSprite.flip_h = false
		
