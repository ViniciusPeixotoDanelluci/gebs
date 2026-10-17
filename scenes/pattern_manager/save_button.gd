extends Button

@export var target_path: String = "res://scenes/saved_patterns"

@onready var dummy_enemy: TemporaryMain = $"../../../../../../../../DummyEnemy"
# Temporary

func _on_pressed() -> void:
	print(dummy_enemy)
	set_owner_recursive(dummy_enemy, dummy_enemy)
	
	var packed_scene := PackedScene.new()
	packed_scene.pack(dummy_enemy)
	var error = ResourceSaver.save(
		packed_scene, 
		target_path+"/pattern"+str(randi()%20)+".tscn"
		# Obviously, this code is also temporary
	)

	if error == OK:
		print("Scene saved")
	else:
		print("Failed to save. error code: ", error)

func set_owner_recursive(node: Node, root_node):
	for child in node.get_children():
		if child is Bullet: continue
		child.owner = root_node
		set_owner_recursive(child, root_node)
