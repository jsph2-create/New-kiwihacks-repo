extends Node2D
var exploder = preload("uid://b2ih44b2xcht2")


func explode() -> void:
	var expos = exploder.instantiate()
	expos.global_position = global_position
	get_tree().current_scene.add_child(expos)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	explode()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
