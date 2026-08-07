class_name PropertyValue
extends LineEdit

@export var _settings_container: SettingsContainer
@export var _value_type: Variant.Type
@export var _initial_value: String = "0"
@export var _property_name: String = "name"

func _ready() -> void:
	text = _initial_value
	## You could call _emit_new_value(_initial_value, self) here instead, if you want

func _on_property_value_submitted(new_text: String, source: LineEdit) -> void:
	if new_text.is_empty() or !new_text.is_valid_float() and !new_text.is_valid_float():
		_emit_new_value(_initial_value, source)
		push_warning("The property value must be a number")
		return

	match _value_type:
		TYPE_FLOAT:
			_emit_new_value(str(float(new_text)), source)
		TYPE_INT:
			_emit_new_value(str(int(new_text)), source)

func _emit_new_value(new_value: String, source: LineEdit) -> void:
	text = new_value
	_settings_container.property_changed.emit(_property_name, new_value, source)
