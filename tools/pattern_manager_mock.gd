@tool 
class_name PatternManagerPluginMock
extends EditorScript

const DEBUGGER = preload("uid://bf20kgffccjgl")
const PATTERN_MANAGER = preload("uid://umhcxdues32s")
const MANAGER_TEST = preload("uid://dknii0ucg2kso")

var window: Window

func _run() -> void:
	window = Window.new()
	EditorInterface.popup_dialog(window, Rect2(Vector2(100, 100), Vector2(1280, 720)))
	
	var d: CanvasLayer = DEBUGGER.instantiate()
	var pm: CanvasLayer = PATTERN_MANAGER.instantiate()
	
	var mt: Node2D = MANAGER_TEST.instantiate()
	
	window.add_child(mt)
	
	window.close_requested.connect(func(): window.queue_free())
	print("hello eu mesmo")
