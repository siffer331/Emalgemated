extends Node

export var acceleration := 2000.0
export var max_speed := 200.0

var dir := 0
var velocity := Vector2.ZERO


func movement(delta: float) -> void:
	var direction := get_move_direction()
	velocity = Util.calculate_velocity(velocity, max_speed, acceleration, delta, direction)
	velocity = owner.move_and_slide(velocity)


func orient_player() -> void:
	dir = int(owner.get_local_mouse_position().angle()/(PI/2))
	var v := Vector2.ZERO
	owner.sprite.frame.x = dir


func get_move_direction() -> Vector2:
	return Vector2(
		Input.get_action_strength("player_move_right") - Input.get_action_strength("player_move_left"),
		Input.get_action_strength("player_move_down") - Input.get_action_strength("player_move_up")
	).normalized()


func basic_input(event: InputEvent) -> void:
	pass
