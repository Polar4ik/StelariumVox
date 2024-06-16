extends Node2D

var trg_pos := Vector2.ZERO
var trg_point := Vector2.ZERO

func _process(_delta: float) -> void:
	G.pioner_position = $Player.position
	
	if Input.is_action_just_pressed("LBMClick"):
		trg_pos = get_global_mouse_position()
	
	if Input.is_action_just_pressed("mov") and trg_pos != trg_point:
		trg_point = trg_pos
		$Player.velocity = $Player.position.direction_to(trg_point) * 50
		G.is_move = true
		$Player/AudioStreamPlayer2D.play()
	
	if trg_point.distance_to($Player.position) <= 10:
		$Player.velocity = Vector2.ZERO
		G.is_move = false
		$Player/AudioStreamPlayer2D.stop()
	
	queue_redraw()

func _physics_process(_delta: float) -> void:
	$Player.move_and_slide()

func _draw() -> void:
	draw_line($Player.position, trg_pos, Color.WHITE, 1.0, true)

func _on_check_planet_body_entered(body: Node2D) -> void:
	G.can_test = true
	G.planet = body.planet_name
	E.planet_entered.emit()
	

func _on_check_planet_body_exited(_body: Node2D) -> void:
	G.can_test = false


func _on_camera_button_button_down() -> void:
	E.move_close.emit()


func _on_info_button_button_down() -> void:
	E.move_close.emit()
