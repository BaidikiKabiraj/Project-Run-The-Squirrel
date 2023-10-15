extends Node2D


func _ready():
	Utils.saveGame()
	Utils.loadGame()


func _on_play_again_pressed():
	get_tree().change_scene_to_file("res://world.tscn")
