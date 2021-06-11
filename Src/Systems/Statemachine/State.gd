#Class for handeling state behavier delegatet from `StateMachine` 
class_name State
extends Node

onready var state_machine := _get_state_machine(self)

var controller: Node

func _init() -> void:
	add_to_group("State")


func physics_process(_delta: float) -> void:
	pass


func process(delta: float) -> void:
	pass


func unhandled_input(_event: InputEvent) -> void:
	pass


func enter(_args: Dictionary) -> void:
	pass


func exit() -> void:
	pass


func _get_state_machine(node: Node) -> Statemachine:
	if node is Statemachine:
		return node as Statemachine
	return _get_state_machine(node.get_parent())
