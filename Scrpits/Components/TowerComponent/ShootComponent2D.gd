extends Node2D
tool 
class_name ShootComponent2D


export var shoot_timer:NodePath
export (PackedScene) var bullet_scene 
export var direction_component:NodePath
export var enanbled:bool = true

onready var _dir_component = get_node_or_null(direction_component)
onready var _shoot_timer:Timer = get_node_or_null(shoot_timer)


func _ready() -> void:
	if _shoot_timer:
# warning-ignore:return_value_discarded
		_shoot_timer.connect("timeout", self, "_on_shoot_timeout")


func shoot() -> void:
	var bullet = bullet_scene.instance()
	var direction:Vector2 = _dir_component.direction
	get_tree().current_scene.add_child(bullet)
	bullet.velocity = direction
	bullet.rotation_degrees = direction.angle()


func _on_shoot_timeout() -> void:
	shoot()
