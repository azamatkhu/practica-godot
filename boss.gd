extends Enemy
class_name Boss

func _process(delta: float) -> void:
	if health == 0:
		queue_free()
