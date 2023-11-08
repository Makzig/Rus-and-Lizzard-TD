extends Node
class_name State

var state_machine = null


func handle_input(_event: InputEvent) -> void:
	pass

func update(_delta: float) -> void:
	pass

func physics_update(_delta: float) -> void:
	pass

func enter_state(_state_need := {}) -> void:
	pass

func exit_state() -> void:
	pass
