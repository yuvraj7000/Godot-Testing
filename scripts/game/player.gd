extends CharacterBody2D

var is_rotating : bool = true
var rotation_speed : float = 4.0
var rotation_dir : int = 1   # 1 = clockwise, -1 = anticlockwise

var move_speed : float = 600
var is_moving : bool = false

const fire_scene = preload("res://scenes/game/fire.tscn")
@onready var muzzle = $Marker2D
@onready var button = $"../Button"
@onready var anim = $AnimatedSprite2D

func _ready() -> void:
	button.button_down.connect(_on_button_button_down)
	button.button_up.connect(_on_button_button_up)
	anim.play("normal")
	draw_circle(muzzle.position, 5, Color.RED)

func  _physics_process(delta: float) -> void:
	if is_rotating :
		rotation += rotation_dir * rotation_speed * delta
	
	if is_moving:
		velocity = -1 * transform.y * move_speed
	else :
		velocity = Vector2.ZERO
	move_and_slide() 

func _on_button_button_down() -> void:
	print("fire")
	anim.play("shoot")
	is_rotating = false
	is_moving = true
	shoot()
	

func _on_button_button_up() -> void:
	rotation_dir *= -1
	is_moving = false
	is_rotating = true
	print("up")
	
func shoot():
	var fire = fire_scene.instantiate()
	var dir = -global_transform.y  
	fire.global_position = muzzle.global_position
	fire.global_rotation = global_rotation
	fire.direction = dir
	fire.scale = Vector2(0.1, 0.1)
	print("Tank:", global_position)
	print("Muzzle:", muzzle.global_position)
	get_tree().current_scene.add_child(fire) 
