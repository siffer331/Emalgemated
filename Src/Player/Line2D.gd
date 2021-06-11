extends Line2D



func _ready():
	var sprite: Sprite = get_node("../Sprite")
	print(typeof(sprite.texture))
