extends CharacterBody3D

func _on_left_button_button_down() -> void:
	rotation_degrees.y += 5

func _on_right_button_button_down() -> void:
	rotation_degrees.y -= 5

func _process(_delta: float) -> void:
	position.x = G.pioner_position.y
	position.z = -G.pioner_position.x
