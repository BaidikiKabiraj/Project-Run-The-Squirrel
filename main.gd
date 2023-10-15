extends Node2D

func _ready():
	print("run")
	Utils.saveGame()
	Utils.loadGame()


func _on_quit_pressed():
	get_tree().quit()


func _on_play_pressed():
	get_tree().change_scene_to_file("res://world.tscn")
