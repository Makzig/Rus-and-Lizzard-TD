extends Node2D
class_name HealthComponent2D

export var health_area: NodePath
export var max_health = 100

onready var health: float
onready var _health_box: Area2D = get_node_or_null(health_area)

func _ready() -> void:
	health = max_health



