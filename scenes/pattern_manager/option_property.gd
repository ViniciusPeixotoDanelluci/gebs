class_name OptionProperty
extends OptionButton

@export var _settings_container: SettingsContainer
@export_enum(
	"CircleState", 
	"SpawnMode", 
	"ReleaseMode", 
	"AimMode", 
	"LineMode",
	"RandBulletAngleMode"
) var enum_keys: String = "CircleState"

func _ready() -> void:
	var rbs = RadialBulletSpawner.new()
	# You Could also place the spawner in a Group and write a onready var instead

	for i in rbs.get(enum_keys).keys():
		add_item(i)

func _on_item_selected(index: int, source: OptionButton) -> void:
	match enum_keys:
		"CircleState":
			_settings_container.property_changed.emit("circle_state", index, source)
		"SpawnMode":
			_settings_container.property_changed.emit("spawn_mode", index, source)
		"ReleaseMode":
			_settings_container.property_changed.emit("local_release_mode", index, source)
		"AimMode":
			_settings_container.property_changed.emit("aim_mode", index, source)
		"LineMode":
			_settings_container.property_changed.emit("line_mode", index, source)
		"RandBulletAngleMode":
			match get_item_text(index):
				"ZERO_TO_SIGN":
					_settings_container.property_changed.emit("rand_bullet_angle_mode", 0, source)
				"OFF":
					_settings_container.property_changed.emit("rand_bullet_angle_mode", 1, source)
				"FULL_RANGE":
					_settings_container.property_changed.emit("rand_bullet_angle_mode", -1, source)
	#print(get_item_text(index))
