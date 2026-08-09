extends Button

@export var target_path: String = "res://scenes/saved_patterns"

@onready var main_node: Node2D = $"../../../../../../../../main"
# Temporary

func _on_pressed() -> void:
	print(main_node)
	set_owner_recursive(main_node, main_node)
	
	var packed_scene := PackedScene.new()
	packed_scene.pack(main_node)
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
