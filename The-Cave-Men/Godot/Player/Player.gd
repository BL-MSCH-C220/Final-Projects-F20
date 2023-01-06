extends KinematicBody2D

onready var SM = $StateMachine

var timer = null
var health = 100
var velocity = Vector2.ZERO
var jump_power = Vector2.ZERO
var direction = 1

export var gravity = Vector2(0,30)

export var move_speed = 20
export var max_move = 300

export var jump_speed = 100
export var max_jump = 1000

export var leap_speed = 100
export var max_leap = 1000

var moving = false
var is_jumping = false
var double_jumped = false

var death_pit_pos = 1400


func _physics_process(_delta):
	velocity.x = clamp(velocity.x,-max_move,max_move)
		
	if direction < 0 and not $AnimatedSprite.flip_h: $AnimatedSprite.flip_h = true
	if direction > 0 and $AnimatedSprite.flip_h: $AnimatedSprite.flip_h = false
	
	if is_on_floor():
		double_jumped = false
	
	if position.y >= death_pit_pos:
		die()

func is_moving():
	if Input.is_action_pressed("left") or Input.is_action_pressed("right"):
		return true
	return false

func move_vector():
	return Vector2(Input.get_action_strength("right") - Input.get_action_strength("left"),1.0)

func set_animation(anim):
	if $AnimatedSprite.animation == anim: return
	if $AnimatedSprite.frames.has_animation(anim): $AnimatedSprite.play(anim)
	else: $AnimatedSprite.play()

func is_on_floor():
	var fl = $Floor.get_children()
	for f in fl:
		if f.is_colliding():
			return true
	return false

func _unhandled_input(event):
	if event.is_action_pressed("left"):
		direction = -1
	if event.is_action_pressed("left") and is_on_floor() == true:
		$Walk.play()
	if event.is_action_pressed("right"):
		direction = 1
	if event.is_action_pressed("right") and is_on_floor() == true:
		$Walk.play()
	if event.is_action_released("left") or is_on_floor() == false:
		$Walk.stop()
	if event.is_action_released("right") or is_on_floor() == false:
		$Walk.stop()


func is_on_right_wall():
	if $Wall/Right.is_colliding():
		return true
	return false

func is_on_left_wall():
	if $Wall/Right.is_colliding():
		return true
	return false

func die():
	queue_free()

func do_damage(d):
	queue_free()

func health_decrement():
	health -= 25



func _ready():
	timer = Timer.new()
	timer.set_one_shot(false)
	timer.set_wait_time(0.25)
	timer.connect("timeout", self, "health_decrement")
	add_child(timer)


