extends Node

export var acceleration := 2000.0
export var max_speed := 200.0
export var capture_speed := 700.0
export var capture_max := 1

var dir := 0
var velocity := Vector2.ZERO

var capturing: Node2D
var capture_length := 0.0 setget _set_capture_length
var animation_point := Vector2.ZERO
var captured := []


func movement(delta: float) -> void:
	var direction := get_move_direction()
	velocity = Util.calculate_velocity(velocity, max_speed, acceleration, delta, direction)
	velocity = owner.move_and_slide(velocity)
	for enemy in captured:
		var controller = enemy.get_node("Statemachine/Controller")
		controller.move(direction, delta)


func orient_player() -> void:
	var mouse_point = owner.get_local_mouse_position()
	dir = int((mouse_point.angle()+PI)/(PI/2))
	var v := Vector2.ZERO
	owner.sprite.frame_coords.y = dir%4
	owner.capture_cast.cast_to = mouse_point


func get_move_direction() -> Vector2:
	return Vector2(
		Input.get_action_strength("player_move_right") - Input.get_action_strength("player_move_left"),
		Input.get_action_strength("player_move_down") - Input.get_action_strength("player_move_up")
	).normalized()


func basic_input(event: InputEvent) -> void:
	if event.is_action_pressed("use"):
		if capture_length == 0:
			cast_capture()
		for enemy in captured:
			var controller = enemy.get_node("Statemachine/Controller")
			controller.use(owner.get_local_mouse_position())


func cast_capture() -> void:
	if owner.capture_cast.is_colliding():
		var hit: Node2D = owner.capture_cast.get_collider()
		if hit.is_in_group("Capturable"):
			capturing = hit
			animation_point = hit.position-owner.position
		else:
			animation_point = owner.capture_cast.get_collision_point() - owner.position
	else:
		animation_point = owner.get_local_mouse_position()
	(owner.tween as Tween).interpolate_property(
		self,
		"capture_length",
		0.0,
		1.0,
		(animation_point).length()/capture_speed
	)
	animation_point += owner.position
	owner.tween.start()
	owner.chain_animator.play("ChainWave", 2)


func _set_capture_length(value: float) -> void:
	var point := Vector2.ZERO
	capture_length = value
	if capturing:
		point = capturing.position - owner.position
	else:
		point = animation_point - owner.position
	owner.capture.points[1] = point*capture_length


func _on_Tween_tween_completed(object: Node, key: String) -> void:
	if key == ":capture_length":
		if capture_length == 0:
			return
		if capturing:
			self.capture_length = 0
			var chain = load("res://Src/Player/Chain.tscn").instance()
			owner.add_child(chain)
			capturing.get_node("Statemachine/Controller").is_controlled = true
			chain.controlling = capturing
			chain.connect("broken", self, "_on_Chain_broken")
			if len(captured) < capture_max:
				captured.append(capturing)
			capturing = null
		else:
			owner.tween.interpolate_property(
				self,
				"capture_length",
				1.0,
				0.0,
				(animation_point-owner.position).length()/(capture_speed*2)
			)
			owner.capture.get_material().set_shader_param("index", 7)
		owner.chain_animator.stop()


func _on_Chain_broken(controlling: Node2D) -> void:
	controlling.get_node("Statemachine/Controller").is_controlled = false
	captured.erase(controlling)
