extends Node2D

func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://levels/ChoseOption.tscn")
	
func _on_settings_button_pressed():
	SettingsMenu.show()
