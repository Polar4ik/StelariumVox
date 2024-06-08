extends CharacterBody3D

func _on_left_button_button_down() -> void:
	rotation_degrees.y += 1

func _on_right_button_button_down() -> void:
	rotation_degrees.y -= 1
