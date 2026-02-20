extends Node2D

# We use @onready to grab a reference to the menu when the game starts
@onready var pause_menu = $CanvasLayer/Pausemenu
@onready var pause_button = $CanvasLayer/Pause
func change_visibility() ->void:
	pause_menu.visible = !pause_menu.visible
	pause_button.visible = !pause_button.visible

func _process(_delta: float) -> void:
	# Check if the "ui_cancel" action (default for Escape) is pressed
	if Input.is_action_just_pressed("ui_cancel"):
		change_visibility()


func _on_quit_pressed() -> void:
	get_tree().change_scene_to_file("res://levels/node_2d.tscn") # Replace with function body.


func _on_pause_pressed() -> void:
	change_visibility()


func _on_resume_pressed() -> void:
	change_visibility()
