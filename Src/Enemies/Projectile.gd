extends Area2D


export var speed := 500


func _process(delta: float) -> void:
	position += transform.x*speed*delta


func _on_Timer_timeout() -> void:
	queue_free()


func _on_body_entered(body: PhysicsBody2D) -> void:
	queue_free()

