extends State

func physics_process(delta: float) -> void:
	if controller.get_move_direction() != Vector2.ZERO:
		state_machine.transition_to("Run")
	controller.movement(delta)


func process(delta: float) -> void:
	controller.orient_player()


func unhandled_input(event: InputEvent) -> void:
	controller.basic_input(event)
