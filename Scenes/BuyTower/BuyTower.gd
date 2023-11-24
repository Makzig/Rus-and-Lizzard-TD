extends Control

export var show_button:NodePath

onready var _show_button:Button = get_node_or_null(show_button)
onready var towers:Array = [
	load("res://Scenes/Tower/Archery/Archery.tscn"), 
	load("res://Scenes/Tower/MobTower/MobTower.tscn"),
	load("res://Scenes/Tower/Magic/Magic.tscn"),
	load("res://Scenes/Tower/Artelary/Artilary.tscn"),
	load("res://Scenes/Tower/Apility/Apility.tscn")
	]

var is_open:bool = false

func _ready() -> void:
	if _show_button:
# warning-ignore:return_value_discarded
		_show_button.connect("pressed", self, "_on_show_pressed")
	rect_scale = Vector2.ZERO
	

func _input(event):
	if event is InputEventMouseButton and event.is_pressed():
		if is_open:
			anim_hide()

func anim_show() -> void:
	var tween := create_tween().set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_OUT)
	rect_scale = Vector2.ZERO
	is_open = true
# warning-ignore:return_value_discarded
	tween.tween_property(self, "rect_scale", Vector2.ONE, 0.5)

func anim_hide() -> void:
	var tween := create_tween().set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_IN)
	rect_scale = Vector2.ONE
	is_open = false
# warning-ignore:return_value_discarded
	tween.tween_property(self, "rect_scale", Vector2.ZERO, 0.5)


func _on_show_pressed() -> void:
	if !is_open:
		anim_show()
	else:
		anim_hide()



func spawn_tower(tower_index:int) -> void:
	var tower = towers[tower_index].instance()
	get_tree().current_scene.add_child(tower)
	tower.global_position = get_parent().global_position
	get_parent().queue_free()

func _on_Archers_pressed():
	spawn_tower(0)


func _on_Warriars_pressed():
	spawn_tower(1)


func _on_Magic_pressed():
	spawn_tower(2)


func _on_Apility_pressed():
	spawn_tower(4)


func _on_Artylary_pressed():
	spawn_tower(3)
