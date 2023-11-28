extends TextureButton

export(PackedScene) var action_scene
export(MouseStateMachine.MouseStates) var state_instance = MouseStateMachine.MouseStates.IDLE
export(int , 1, 2) var number_apility = 1
export(float) var recharge_time = 0.0

onready var apility_timer:Timer = $Timer 
onready var texture_progress:TextureProgress = $TextureProgress

var apility_ready:bool = true

func _ready() -> void:
	set_physics_process(false)
	texture_progress.value = 0
	texture_progress.max_value = recharge_time
# warning-ignore:return_value_discarded
	self.connect("pressed", self, "_on_pressed")
# warning-ignore:return_value_discarded
	apility_timer.connect("timeout", self, "_on_timeout")

signal apility_start





func _physics_process(_delta):
	anim_texture()

func _input(_event:InputEvent) -> void:
	if Input.is_action_just_pressed(str(number_apility) + "_apility"):
		set_mouse_state()
	if Input.is_action_just_pressed("attack"):
		spawn_apility()


func can_use() -> bool:
	if MouseStateMachine.state == state_instance and apility_ready:
		return true
	return false

func spawn_apility() -> void:
	if !can_use():
		return
	apility_timer.start(recharge_time)

	apility_ready = false
	emit_signal("apility_start")
	var apility = action_scene.instance()
	texture_progress.value = 0
	set_physics_process(true)
	get_tree().current_scene.add_child(apility)
	apility.global_position = get_global_mouse_position()
	MouseStateMachine.state = MouseStateMachine.MouseStates.IDLE

func anim_texture() -> void:
	var delta = get_physics_process_delta_time()
	texture_progress.value += delta

func set_mouse_state() -> void:
	MouseStateMachine.state = state_instance



func _on_pressed() -> void:
	set_mouse_state()

func _on_timeout() -> void:
	apility_ready = true
	set_physics_process(false)
	texture_progress.value = 0
