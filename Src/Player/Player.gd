extends KinematicBody2D


onready var capture: Line2D = $Capture
onready var capture_cast: RayCast2D = $CaptureCast
onready var sprite: Sprite = $Sprite
onready var tween: Tween = $Tween
onready var animator: AnimationPlayer = $AnimationPlayer
