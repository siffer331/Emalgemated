#Class for delegating engine functions to `State` nodes 
class_name Statemachine
extends Node


export var initial_state: NodePath
export var controller_path: NodePath

var state: Node
var controller: Node


func _ready() -> void:
	yield(owner, "ready")
	controller = get_node(controller_path)
	transition_to(initial_state)


func _physics_process(delta: float) -> void:
	state.physics_process(delta)


func _process(delta: float) -> void:
	state.process(delta)


func _unhandled_input(event: InputEvent) -> void:
	state.unhandled_input(event)


#Transition to a new `State` at `state_path` and parses `args` if the state is valid
func transition_to(state_path: String, args: Dictionary = {}) -> void:
	if not has_node(state_path) or not get_node(state_path).is_in_group("State"):
		return
	
	if state:
		state.exit()
	state = get_node(state_path)
	state.controller = controller
	#print(state.name)
	state.enter(args)
