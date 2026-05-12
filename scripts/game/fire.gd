extends CharacterBody2D

var speed = 800
var direction = Vector2.ZERO

const BLAST_SCENE = preload("res://scenes/game/blast.tscn")

var exploded := false

func _physics_process(delta):
	if exploded:
		return
	
	velocity = direction * speed
	move_and_slide()

	for i in range(get_slide_collision_count()):
		var collision = get_slide_collision(i)
		var body = collision.get_collider()

		if body == null:
			continue

		exploded = true

		print("Collided with: ", body.name)

		# Create blast
		var blast = BLAST_SCENE.instantiate()
		blast.play("tank")
		blast.global_position = global_position
		
		
		# Add blast safely
		get_parent().add_child(blast)

		# Destroy enemy
		if body.name != "stone":
			body.queue_free()
		else:
			print("stone is hitted")

		# Hide bullet immediately
		hide()

		# Remove bullet after current frame
		call_deferred("queue_free")

		break
