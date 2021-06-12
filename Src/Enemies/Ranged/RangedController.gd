extends EnemyController


func use(dir: Vector2) -> void:
	var projectile = load("res://Src/Enemies/Projectile.tscn").instance()
	owner.get_parent().add_child(projectile)
	projectile.rotation = dir.angle()
	projectile.position = owner.position
