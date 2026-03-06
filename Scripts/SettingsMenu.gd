extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	hide()

func _on_done_button_pressed():
	hide()

func _on_volume_slider_value_changed(value):
	var bus_index = AudioServer.get_bus_index("Master")
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(value))
	
