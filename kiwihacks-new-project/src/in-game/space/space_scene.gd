extends Node2D
var rng = RandomNumberGenerator.new()

@export var spawning_range = 10000
@export var spawn_sun : PackedScene
	
func spawn(item, range = spawning_range, origin = Vector2(0,0) ) -> void:
	var spawn_item = item.instantiate()
	rng.randomize()
	var rand_pos_x = rng.randi_range(-range, range)
	rng.randomize()
	var rand_pos_y = rng.randi_range(-range, range)

	spawn_item.global_position.x = Vector2(origin).x + rand_pos_x

	spawn_item.global_position.y = Vector2(origin).y + rand_pos_y
	
	
	get_tree().current_scene.add_child(spawn_item)



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	spawn(spawn_sun)
