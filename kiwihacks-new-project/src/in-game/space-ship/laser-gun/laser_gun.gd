extends Node2D
@export var raycast: RayCast2D
@export var barrel: Marker2D

func draw_line_between(from: Vector2, to: Vector2, color: Color = Color.WHITE, width: float = 2.0) -> Line2D:
	var line := Line2D.new()
	line.width = width
	line.default_color = color
	line.points = PackedVector2Array([from, to])
	add_child(line)
	return line

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func beam(loc) -> void:
	var tween = create_tween()
	var line = draw_line_between(barrel.position, loc , Color.GREEN, 30.0)
	tween.tween_property(line, "modulate", Color.TRANSPARENT, 0.3)
	await get_tree().create_timer(1.0).timeout
	line.queue_free()



func fire():
	raycast.force_raycast_update()
	if raycast.is_colliding():
		var collider = raycast.get_collider()
		var hit_location = raycast.get_collision_point()
		if collider.get_parent().get("star"):
			collider.get_parent().explode()
			beam(to_local(hit_location))
	else:
		beam(raycast.target_position)
		
			
		
	
