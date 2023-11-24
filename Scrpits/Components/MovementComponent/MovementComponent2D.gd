extends Node2D
class_name MovementComponent2D

export(float,0,10000) var acceleration 
export(float,0,10000) var max_speed
export(float,0,10000) var friction 

export(bool) var enabled = true setget set_enabled


export var direction_component:NodePath

onready var _direction_component:DirectionComponent2D=get_node_or_null(direction_component)


var move_character:KinematicBody2D
var velocity = Vector2.ZERO


func _ready() -> void: 
	yield(owner, "ready")
	move_character = owner
	set_physics_process(enabled)

func movement() -> void:
	var direction:Vector2 = _direction_component.direction
	var delta_time:float = get_physics_process_delta_time() 
	
	if direction != Vector2.ZERO:
		velocity += acceleration * direction * delta_time
		velocity = velocity.clamped(max_speed * delta_time)
	elif direction == Vector2.ZERO:
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta_time)
	velocity = move_character.move_and_slide(velocity)
	
func set_enabled(new_enabled) -> void:
	enabled = new_enabled
	set_physics_process(enabled)

func _physics_process(delta:float) -> void:
	movement()
