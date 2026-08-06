extends Node2D

@onready var bullet_spawner: = $bullet_spawner as RadialBulletSpawner
@onready var target: = $target as Sprite2D

func _ready():
	bullet_spawner.target = target

#func _input(event):
	## comment this function if you want to use the manager properly
	#if event.is_action_pressed("LEFT_CLICK"):
		#$AnimationPlayer.stop(true)
		#await get_tree().create_timer(4.0).timeout
		#$AnimationPlayer.play("demo")
	#if event.is_action_pressed("ui_cancel"):
		#$AnimationPlayer.stop(true)
