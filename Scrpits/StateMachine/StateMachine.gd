extends Node
class_name StateMachine


export var start_state:NodePath

onready var _state:State = get_node_or_null(start_state)

signal transitioned(state_name)

func _ready() -> void:
	yield(owner, "ready")
	for child in get_children():
		child.state_machine = self
	_state.enter()

func _unhandled_input(event: InputEvent) -> void:
	_state.handle_input(event)


func _process(delta: float) -> void:
	_state.update(delta)


func _physics_process(delta: float) -> void:
	_state.physics_update(delta)


func change_to(state_name: String, state_need: Dictionary = {}) -> void:
	if not has_node(state_name):
		return
	_state.exit()
	_state = get_node(state_name)
	_state.enter(state_need)
	emit_signal("transitioned", _state.name)
