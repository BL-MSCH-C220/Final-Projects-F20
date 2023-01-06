extends Node2D

export var spawn_location = Vector2(100,100)
onready var Player = load('res://Player/Player.tscn')

func _physics_process(_delta):
	var player = get_node_or_null("Player")
	if player == null:
		player = Player.instance()
		player.position = spawn_location
		player.name = "Player"
		add_child(player)



func _on_tinylake1_body_entered(body):
	pass # Replace with function body.
