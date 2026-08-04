class_name PatternManager
extends CanvasLayer

@export var all_settings: Array[SettingsContainer]
@export var bullet_spawner: RadialBulletSpawner
@export var pattern_start_timer: Timer

func _ready() -> void:
	for i in all_settings:
		i.connect("property_changed", _on_prop_change)

	if !pattern_start_timer:
		push_warning("There is no timer assined to pattern_start_timer")
		return
	pattern_start_timer.start()

func _on_prop_change(property_name: String, new_value: Variant, _source: Control):
	# source can be is here in case the signal emitter is needed

	if !bullet_spawner:
		push_warning("There is no spawner assined to bullet_spawner")
		return

	print("Property: ", property_name)
	print("Property old value: ", bullet_spawner.get(property_name))
	bullet_spawner.set(property_name, new_value)
	print(bullet_spawner.arc_width_degrees)
	print(bullet_spawner.arc_rotation_degrees)
	print("Property new value: ", bullet_spawner.get(property_name))
