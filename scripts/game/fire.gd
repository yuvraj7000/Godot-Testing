extends CharacterBody2D

var speed = 800
var direction = Vector2.ZERO

func _ready():
	print("fire : " + str(global_position))

func _physics_process(delta):
	
	velocity = direction * speed
	move_and_slide()
