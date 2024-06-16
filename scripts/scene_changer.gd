extends Control

@export var scene: PackedScene

func _input(_e: InputEvent) -> void:
	if Input.is_action_just_pressed("continue"):
		$AnimationPlayer.play("End")

func change_scene() -> void:
	get_tree().change_scene_to_file(scene.resource_path)
