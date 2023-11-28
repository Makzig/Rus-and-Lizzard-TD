extends Node2D



onready var anim_sprite:AnimatedSprite = $AnimatedSprite



func _input(event:InputEvent) -> void:
	if event is InputEventMouseMotion:
		self.global_position = event.global_position


func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
# warning-ignore:return_value_discarded
	MouseStateMachine.connect("change_mouse_state", self, "_on_change_mouse_state")



func _on_change_mouse_state(state) -> void:
	#print(state)
	match state:
		MouseStateMachine.MouseStates.IDLE:
			anim_sprite.play("Idle")
		MouseStateMachine.MouseStates.MOVE_TO:
			anim_sprite.play("MoveTo")
		MouseStateMachine.MouseStates.FIRE_STRIKE:
			anim_sprite.play("FireStrike")
		MouseStateMachine.MouseStates.SPAWN_HELPERS:
			anim_sprite.play("SpawnHelpers")



