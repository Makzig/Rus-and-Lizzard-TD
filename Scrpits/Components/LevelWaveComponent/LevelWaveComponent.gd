extends Node2D
class_name LevelWaveComponent2D , "res://Icons/Money.png"


export (int,  0, 20000) var level_money:int
var health:int = 20



func _ready() -> void:
	EventBus.level_component = self
	if get_child_count() != 0:
		for i in get_children():
			i.connect("area_entered", self , "_on_enemy_entered")
# warning-ignore:return_value_discarded
	EventBus.connect("add_money", self, "_on_add_money")
# warning-ignore:return_value_discarded
	EventBus.connect("buy_tower", self, "_on_buy_tower")




func _on_buy_tower(money) -> void:
	level_money -= money

func _on_add_money(money) -> void:
	level_money += money

func _on_enemy_entered(area) -> void:
	if area.is_in_group("EnemyHitbox"):
		health -= area.wave_damage
