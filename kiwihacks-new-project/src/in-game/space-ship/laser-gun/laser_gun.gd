extends Node2D
@export var raycast: RayCast2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func fire():
	raycast.force_raycast_update()
	if raycast.is_colliding():
		var collider = raycast.get_collider()
		print(collider)
		
		if collider.get_parent().get("star"):
			collider.get_parent().explode()
	
