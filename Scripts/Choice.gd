extends CanvasLayer

@onready var suit_buttons = $VBoxContainer/HBoxContainer2/Button.button_group
@onready var ship_buttons = $VBoxContainer/HBoxContainer/Button.button_group

func _on_start_pressed() -> void:
	var selected_suit = suit_buttons.get_pressed_button().text
	var selected_ship = ship_buttons.get_pressed_button().text
	GameDetails.ShipSelected = selected_ship
	GameDetails.SuitSelected = selected_suit
	get_tree().change_scene_to_file("res://levels/level_2.tscn.tscn")
