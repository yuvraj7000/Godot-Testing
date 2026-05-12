extends AnimatedSprite2D

func _ready():
	play("tank")

func _on_animation_finished():
	queue_free()
