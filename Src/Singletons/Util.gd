class_name Util
extends Node

static func calculate_velocity(
		old_velocity: Vector2,
		target_speed: float,
		acceleration: float,
		delta: float,
		target_direction: Vector2
	) -> Vector2:
	var new_velocity := old_velocity
	var difference := target_direction*target_speed - old_velocity
	if difference.length() > acceleration*delta:
		difference = difference.normalized()*acceleration*delta
	new_velocity += difference
	
	return new_velocity
