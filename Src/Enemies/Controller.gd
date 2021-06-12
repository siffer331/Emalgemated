extends Node


export var acceleration := 2000.0
export var max_speed := 200.0

var velocity := Vector2.ZERO
var is_controlled := false


func move(direction: Vector2, delta: float):
	velocity = Util.calculate_velocity(velocity, max_speed, acceleration, delta, direction)
	velocity = owner.move_and_slide(velocity)
