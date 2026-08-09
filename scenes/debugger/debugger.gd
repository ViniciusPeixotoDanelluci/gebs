class_name PerformanceMonitor extends CanvasLayer

@onready var debugger_container: PanelContainer = %DebuggerContainer
@onready var fps_usage: Label = %FPS
@onready var memory_usage: Label = %MemoryUsage
@onready var objects: Label = %Objects
@onready var draw_number: Label = %DrawNumber
@onready var elapsed_time: Label = %Time
@onready var spawned_bullets: Label = %Bullets

func _ready() -> void:
	debugger_container.reset_size()

func _process(_delta: float) -> void:
	fps_usage.text = ("FPS: %.1f (Process: %.2f ms)" % [
		Performance.get_monitor(Performance.TIME_FPS),
		Performance.get_monitor(Performance.TIME_PROCESS) * 1000,
	])

	memory_usage.text = (
		"Memory: %s" % _format_memory(Performance.get_monitor(Performance.MEMORY_STATIC))
	)

	objects.text = "Objs: %d | Nodes %d | Res: %d" % [
		Performance.get_monitor(Performance.OBJECT_COUNT),
		Performance.get_monitor(Performance.OBJECT_NODE_COUNT),
		Performance.get_monitor(Performance.OBJECT_RESOURCE_COUNT),
	]

	draw_number.text = (
		"Draw calls: %d" % Performance.get_monitor(Performance.RENDER_TOTAL_DRAW_CALLS_IN_FRAME)
	)

	elapsed_time.text = "Elapsed Time: %.2f" % (Time.get_ticks_msec() / 1000.0)

	var visible_bullets = get_tree().get_nodes_in_group("Bullet").filter(
		func(node): return node.visible == true
	).size()
	# Take in note that the bullet count can eat about 100 fps 
	# with high bullet density. Comment it if you prefer

	spawned_bullets.text = "Bullets on Screen: %d" % visible_bullets

func _format_memory(bytes: float) -> String:
	#if bytes < 1024:
		#return "%d B" % bytes
	#elif bytes < 1024 * 1024:
		#return "%.1f KB" % (bytes / 1024)
	#else:
		return "%.1f MB" % (bytes / (1024 * 1024))

func _on_fullscreen_toggled(toggled_on: bool) -> void:
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		return
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
