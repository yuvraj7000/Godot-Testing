extends MenuButton


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	toggled.connect(_on_toggled)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_toggled(toggled_on: bool) -> void:
	get_tree().change_scene_to_file("res://scenes/game/game.tscn")
