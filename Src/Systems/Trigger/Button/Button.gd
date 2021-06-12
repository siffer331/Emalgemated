extends "res://Src/Systems/Trigger/Trigger.gd"

var holding := 0


func _on_body_entered(body: PhysicsBody2D) -> void:
	holding += 1
	$Sprite.frame = 1


func _on_body_exited(body : PhysicsBody2D) -> void:
	holding -= 1
	if holding == 0:
		$Sprite.frame = 0
