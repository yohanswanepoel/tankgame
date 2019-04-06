extends Node2D

func _ready():
	set_camera_limits()
	
func set_camera_limits():	
	pass
	var map_limits = $Ground.get_used_rect() #This returns the number of tiles
	var map_cellsize = $Ground.cell_size #size of the cells
	$Player/Camera2D.limit_left = map_limits.position.x * map_cellsize.x
	$Player/Camera2D.limit_top = map_limits.position.y * map_cellsize.y
	$Player/Camera2D.limit_right = map_limits.end.x * map_cellsize.x
	$Player/Camera2D.limit_bottom = map_limits.end.y * map_cellsize.y
	