extends CanvasLayer

@onready var coins_label = $ColorRect/coins_control/coins_label

# Called when the node enters the scene tree for the first time.
func _ready():
	coins_label.text = str("%04d" % Globals.coins)
	Globals.coins = 0

func _on_button_retry_pressed():
	get_tree().change_scene_to_file("res://scenes/main.tscn")
