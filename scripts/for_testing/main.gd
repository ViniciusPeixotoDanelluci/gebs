class_name TemporaryMain
extends Node2D

@onready var bullet_spawner: = $bullet_spawner as RadialBulletSpawner
@onready var target: = $target as Sprite2D
@onready var timer: Timer = $Timer

func _ready():
	bullet_spawner.target = target
	if get_tree().current_scene == self:
		timer.start()

func _input(event):
	if event.is_action_pressed("start_demo"):
		$AnimationPlayer.stop(true)
		await get_tree().create_timer(4.0).timeout
		$AnimationPlayer.play("demo")
	if event.is_action_pressed("stop_demo"):
		$AnimationPlayer.stop(true)
