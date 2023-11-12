extends Node2D


onready var mouse_sprite:AnimatedSprite = $Sprite
const CHECK_AREA = preload("res://Scenes/CheckArea/CheckArea2D.tscn")



func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)


func _input(event):
	if event is InputEventMouseMotion:
		self.global_position = event.position
	if Input.is_action_just_pressed("attack"):
		mouse_sprite.play("Attack")
	elif Input.is_action_just_pressed("bulding"):
		mouse_sprite.play("Bullding")
	if Input.is_action_just_pressed("ui_up"):
		spawn_tower()


func spawn_tower() -> void:
	var check_area = CHECK_AREA.instance()
	add_child(check_area)
	
