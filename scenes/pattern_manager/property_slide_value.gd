class_name SlidePropertyValue
extends HSlider

### TODO?: in case we want to move this script to the HboxContainer,
### I could transform the property_name in a enum with type string, 
### so we wouldn't need to rewrite all the exported variables 

@export var _settings_container: SettingsContainer
@export var _property_name: String = "name"
@export var _label: Label

func _ready() -> void:
	_settings_container.get_property.emit(_property_name, self)
	_label.text = "%.2f" % value
	## You could call _emit_new_value(_initial_value, self) here instead, if you want

#func _on_property_value_submitted(new_text: String, source: LineEdit) -> void:
	#if new_text.is_empty() or !new_text.is_valid_float() and !new_text.is_valid_float():
		#_emit_new_value(_initial_value, source)
		#push_warning("The property value must be a number")
		#return
	#match _value_type:
		#TYPE_FLOAT:
			#_emit_new_value(str(float(new_text)), source)
		#TYPE_INT:
			#_emit_new_value(str(int(new_text)), source)
#
#func _emit_new_value(new_value: String, source: LineEdit) -> void:
	#_settings_container.property_changed.emit(_property_name, new_value, source)


func _on_value_changed(changed_value: float) -> void:
	_settings_container.emit_signal("property_changed", _property_name, changed_value, self)
	_label.text = "%.2f" % changed_value
