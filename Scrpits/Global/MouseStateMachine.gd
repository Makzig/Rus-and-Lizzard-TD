extends Node

enum MouseStates{IDLE, MOVE_TO,  FIRE_STRIKE, SPAWN_HELPERS}

var state = MouseStates.IDLE setget set_mouse_state

signal change_mouse_state(state)



func set_mouse_state(new_state) -> void:
	state = new_state 
	emit_signal("change_mouse_state", new_state)
