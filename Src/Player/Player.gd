extends KinematicBody2D

export var animation_frame := 0 setget _set_animation_frame

onready var capture: Line2D = $Capture
onready var capture_cast: RayCast2D = $CaptureCast
onready var sprite: Sprite = $Sprite
onready var tween: Tween = $Tween
onready var chain_animator: AnimationPlayer = $ChainAnimator
onready var player_animator: AnimationPlayer = $PlayerAnimator


func _set_animation_frame(value: int) -> void:
	if sprite:
		animation_frame = value
		sprite.frame_coords.x = animation_frame
