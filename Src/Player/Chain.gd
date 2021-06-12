extends Line2D

signal broken(controlling)

var controlling: Node2D


func _process(delta: float) -> void:
	if controlling:
		points[1] = to_local(controlling.global_position)
		$RayCast.cast_to = points[1]
		if $RayCast.is_colliding():
			$RayCast.get_collider().glow()
			emit_signal("broken", controlling)
			queue_free()
