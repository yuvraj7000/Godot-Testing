extends CharacterBody2D

var speed = 800
var direction = Vector2.ZERO

func _ready():
	print("fire : " + str(global_position))

func _physics_process(delta):
	velocity = direction * speed
	move_and_slide()
	
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		var body = collision.get_collider()
		
		if body != null:
			print("Collided with: ", body.name)
			
			# 🔥 destroy the object you hit
			body.queue_free()
			
			# destroy bullet itself
			queue_free()
