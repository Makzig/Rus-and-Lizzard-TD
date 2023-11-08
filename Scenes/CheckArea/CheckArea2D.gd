extends Area2D


onready var color_polygon:Polygon2D = $Polygon2D

var has_body:bool = false setget set_body


func _ready() -> void:
# warning-ignore:return_value_discarded
	self.connect("body_entered", self, "_on_body_entered")
# warning-ignore:return_value_discarded
	self.connect("body_exited", self, "_on_body_exited")


func anim_polygon(color:Color) -> void:
	var tween := create_tween().set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_OUT)
# warning-ignore:return_value_discarded
	tween.tween_property(color_polygon, "color", color , 0.7)
	

func set_body(new_body) -> void:
	has_body = new_body
	if has_body:
		anim_polygon(Color.red)
	else:
		anim_polygon(Color.greenyellow)


func _on_body_entered(_body) -> void:
	self.has_body = true

func _on_body_exited(_body) -> void:
	self.has_body = false


