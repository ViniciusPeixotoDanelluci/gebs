class_name OptionProperty
extends OptionButton

@export_enum(
	"CircleState", 
	"SpawnMode", 
	"ReleaseMode", 
	"AimMode", 
	"LineMode",
	"RandBulletAngleMode"
) var enum_keys: String = "CircleState"

@export var _settings_container: SettingsContainer

func _ready() -> void:
	var rbs = RadialBulletSpawner.new()
	# You Could also place the spawner in a Group and write a onready var instead

	for i in rbs.get(enum_keys).keys():
		add_item(i)

func _on_item_selected(index: int, source: OptionButton) -> void:
	
	match enum_keys:
		"CircleState":
			_settings_container.property_changed.emit("circle_state", index, source)
			#print(get_item_text(index))
		"SpawnMode":
			_settings_container.property_changed.emit("spawn_mode", index, source)
			#print(get_item_text(index))
		"ReleaseMode":
			_settings_container.property_changed.emit("local_release_mode", index, source)
			#print(get_item_text(index))
		"AimMode":
			_settings_container.property_changed.emit("aim_mode", index, source)
			#print(get_item_text(index))
		"LineMode":
			_settings_container.property_changed.emit("line_mode", index, source)
			print(get_item_text(index))
		"RandBulletAngleMode":
			_settings_container.property_changed.emit("rand_bullet_angle_mode", index, source)
			print(get_item_text(index))
