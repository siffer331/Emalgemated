extends StaticBody2D

func glow() -> void:
	$Sprite.frame = 1
	$Timer.start()


func _on_Timer_timeout():
	$Sprite.frame = 0
