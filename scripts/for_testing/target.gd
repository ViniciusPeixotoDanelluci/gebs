extends Sprite2D

var tween: Tween

#func _physics_process(delta):
#	global_position = get_global_mouse_position()

func hit():
	tween = create_tween()
	tween.interpolate_property(self, "modulate", Color.RED, Color.WHITE, .5, 
								Tween.TRANS_QUART, Tween.EASE_OUT)
	tween.start()

func _on_area_shape_entered(area_id, area, area_shape, local_shape):
	hit()
#	area.all_bullets[area_shape].set_physics_process(false)
	area.reallocate_bullet(area_shape)
