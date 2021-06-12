extends Line2D


var controlling: Node2D


func _process(delta: float) -> void:
	if controlling:
		points[1] = to_local(controlling.global_position)
