class_name PatternManager
extends CanvasLayer

@export var all_settings: Array[SettingsContainer]
@export var bullet_spawner: RadialBulletSpawner
@export var pattern_start_timer: Timer

func _enter_tree() -> void:
	for i in all_settings:
		i.connect("property_changed", _on_prop_change)
		i.connect("get_property", _on_get_prop)

func _ready() -> void:
	if !pattern_start_timer:
		push_warning("There is no timer assined to pattern_start_timer")
		return

	pattern_start_timer.start()

func _on_prop_change(property_name: String, new_value: Variant, _source: Control):
	# Source is here in case the signal emitter is needed, 
	# it's subjected to be removed in future updates

	if !bullet_spawner:
		push_warning("There is no spawner assined to bullet_spawner")
		return

	print("Property: ", property_name)
	print("Property old value: ", bullet_spawner.get(property_name))
	bullet_spawner.set(property_name, new_value)
	print("Property new value: ", bullet_spawner.get(property_name))

func _on_get_prop(property_name: String, source: Control):
	if !bullet_spawner:
		push_warning("There is no spawner assined to bullet_spawner")
		return

	var prop = bullet_spawner.bullet_res.get_property_list().get(
		bullet_spawner.bullet_res.get_property_list().find_custom(
			func(a): return a.name == property_name
		)
	)
	# This is the same has:
	#var prop_index = bullet_spawner.bullet_res.get_property_list()
	#var propz = prop_index.get(prop_index.find_custom(func(a): return a.name == property_name))

	var min_max_step = prop.hint_string.split(",")
	source.min_value = float(min_max_step[0])
	source.max_value = float(min_max_step[1])
	source.step = float(min_max_step[2])
	source.value = bullet_spawner.bullet_res.get(prop.name)
