extends "res://Src/Systems/Trigger/Trigger.gd"

var holding := 0


func _on_body_entered(body: PhysicsBody2D) -> void:
	holding += 1
	if holding == 1:
		value = true
		emit_signal("value_changed", true)
		$Sprite.frame = 1


func _on_body_exited(body : PhysicsBody2D) -> void:
	holding -= 1
	if holding == 0:
		value = false
		emit_signal("value_changed", false)
		$Sprite.frame = 0


func trigger() -> void:
	holding += 1
	if holding == 1:
		$Sprite.frame = 1
		value = true
		emit_signal("value_changed", true)
	$Timer.start()


func _on_Timer_timeout() -> void:
	holding -= 1
	if holding == 0:
		value = false
		emit_signal("value_changed", false)
		$Sprite.frame = 0
