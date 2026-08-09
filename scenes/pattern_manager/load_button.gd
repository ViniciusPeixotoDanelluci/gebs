extends Button

@onready var file_dialog: FileDialog = $"../../../../../../FileDialog"

func _on_pressed() -> void:
	file_dialog.popup_centered()

func _on_file_dialog_file_selected(path: String) -> void:
	var packed_scene = load(path)
	if packed_scene:
		var main_scene = packed_scene.instantiate()
		print(main_scene.is_class("TemporaryMain"))
		print(main_scene is Node2D)

		if main_scene is Node2D:
			print("Correct Node Selection")
			main_scene.transform = $"../../../../../../../../main".transform
			$"../../../../../../../../main".call_deferred("queue_free")
			$"../../../../../../../..".add_child(main_scene)
			$"../../../../../../..".bullet_container = main_scene.get_child(0)
			$"../../../../../../..".bullet_spawner = main_scene.get_child(1)
			$"../../../../../../..".pattern_start_timer = main_scene.get_child(2)
			$"../../../../../../..".pattern_start_timer.start()
			#TODO: Set all the PatternManager variables when main scene is loaded PROPERLY
			#TODO: Set all the labels when main scene is loaded
		else:
			print("Wrong Node Selection")
			main_scene.queue_free()



	#print("Saving resource! Path ", save_path)
	#if save_path == "" or save_path == "res://.tscn": return
	#if not root_pattern: return
	#packed_root_scene.pack(root_pattern)
	#ResourceSaver.save(save_path, packed_root_scene)
	#print("Attempting to load resource! ", save_path)
	#if not ResourceLoader.exists(save_path):
		#push_warning("File " + save_path + " does not exist!")
		#return
	#var loaded_pattern = ResourceLoader.load(save_path)
	#emit_signal("pattern_loaded", loaded_pattern)
#func _load():
	#print("Attempting to load resource! ", save_path)
	#if not ResourceLoader.exists(save_path):
		#push_warning("File " + save_path + " does not exist!")
		#return
	#var loaded_pattern = ResourceLoader.load(save_path)
	#emit_signal("pattern_loaded", loaded_pattern)
