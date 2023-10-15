extends Node2D


var Cherry = preload(("res://Collectables/Cherry.tscn"))




func _on_timer_timeout():
	var cherryTemp = Cherry.instantiate()
	#var rng = RandomNumberGenerator.new()
	#var ranint = rng.randi_range(201,3000)
	cherryTemp.position = Vector2(100,296)
	add_child(cherryTemp)
