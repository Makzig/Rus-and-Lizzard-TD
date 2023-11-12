extends TextureButton
tool 

export (int, 0, 500) var price_count = 0 setget set_price 

onready var price_label:Label = $Label

signal buy

func _ready() -> void:
# warning-ignore:return_value_discarded
	self.connect("pressed", self, "_on_button_pressed")
	price_label.text = str(price_count)


func set_price(new_price:int) -> void:
	price_count = new_price
	if Engine.editor_hint:
		price_label.text = str(price_count)


func _on_button_pressed() -> void:
	if EventBus.level_component:
		var level_component:LevelWaveComponent2D = EventBus.level_component
		if level_component.level_money >= price_count:
			EventBus.emit_signal("buy_tower", price_count)
			emit_signal("buy")


