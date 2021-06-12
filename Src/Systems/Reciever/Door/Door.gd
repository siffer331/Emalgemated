extends "res://Src/Systems/Reciever/Reciever.gd"


func open() -> void:
	$Sprite.frame = 1
	set_collision_layer_bit(0, false)


func close() -> void:
	$Sprite.frame = 0
	set_collision_layer_bit(0, true)
