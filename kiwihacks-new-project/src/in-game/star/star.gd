extends Node2D
var exploded = false
var star = true
var exploder = preload("uid://b2ih44b2xcht2")
@export var explode_ani : AnimationPlayer
@export var area2d_node : Area2D

func explode() -> void:
	if not exploded:
		exploded = true
		var expos = exploder.instantiate()
		expos.global_position = global_position
		get_tree().current_scene.add_child(expos)
		explode_ani.play("explode")
		area2d_node.queue_free()
		await get_tree().create_timer(5.0).timeout
		queue_free()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
