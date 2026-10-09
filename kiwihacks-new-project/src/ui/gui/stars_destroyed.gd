extends Label
func _ready() -> void:
	EventBus.star_destroyed_ui_change.connect(change_ui)


func change_ui(value) -> void:
	text = "stars destroyed: " + str(value)
