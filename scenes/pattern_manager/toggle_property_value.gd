class_name TogglePropertyValue
extends CheckButton

@export var _settings_container: SettingsContainer
@export var _initial_value: bool = false
@export var _property_name: String = "name"

func _ready() -> void:
	button_pressed = _initial_value

func _on_property_toggled(toggled_on: bool, source: BaseButton) -> void:
	_settings_container.property_changed.emit(_property_name, toggled_on, source)
