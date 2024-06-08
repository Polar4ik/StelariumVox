extends Node2D

var trg_pos := Vector2.ZERO
var isnt_mov := true

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("LBMClick") and isnt_mov:
		trg_pos = get_global_mouse_position()
	
	if Input.is_action_just_pressed("test_mov") and isnt_mov:
		$Player.velocity = -trg_pos.direction_to($Player.position) * 50
		isnt_mov = false
	
	if trg_pos.distance_to($Player.position) <= 10:
		$Player.velocity = Vector2.ZERO
		isnt_mov = true
	
	queue_redraw()

func _physics_process(_delta: float) -> void:
	$Player.move_and_slide()

func _draw() -> void:
	draw_line($Player.position, trg_pos, Color.WHITE, 1.0, true)

func _on_check_planet_body_entered(body: Node2D) -> void:
	if body.is_in_group("planet"):
		G.can_test = true

func _on_check_planet_body_exited(body: Node2D) -> void:
	if body.is_in_group("planet"):
		G.can_test = false
