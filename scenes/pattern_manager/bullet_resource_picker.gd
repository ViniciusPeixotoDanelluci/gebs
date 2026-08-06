extends OptionButton

@export var folder_path: String = "res://resources/"
@export var _settings_container: SettingsContainer

var bullet_resources: Array[BulletResource]

#TODO: Add a bullet Resource Creator

func _ready() -> void:
	if !folder_path:
		printerr("Bullet Resources path is wrong or not specified in the %s" % name)
		return

	for file_name in ResourceLoader.list_directory(folder_path):
		var file_path = folder_path+file_name
		bullet_resources.append(ResourceLoader.load(file_path))
		var raw_img = ResourceLoader.load(file_path).bullet_texture.get_image()
		raw_img.resize(16, 16)
		var icon_texture = ImageTexture.create_from_image(raw_img)
		
		#TEnho Fazer um bagulho pra evitar que recuross com nomes gigantescos sejam criados
		# algo que coloque 3 pontinhos depois de x número é o suficiente se pah 
		add_icon_item(icon_texture, file_name.capitalize().get_slice(".", 0))

func _on_item_selected(index: int, source: OptionButton) -> void:
	print(bullet_resources[index])
	_settings_container.resource_changed.emit(bullet_resources[index])
