extends Node

# Take texture and slice it up in 128 x 128 chuncks and then save it

var tile_size = Vector2(128, 128)
onready var texture = $Sprite.texture

func _ready():
	# e.g. if width of texture is 100px and tile size is 10px then width is 10 tiles
	var texture_width = texture.get_width() / tile_size.x
	var texture_height = texture.get_height() / tile_size.y
	var ts = TileSet.new()
	for x in range(texture_width):
		for y in range (texture_height):
			var region = Rect2(x * tile_size.x, y * tile_size.y,
							   tile_size.x, tile_size.y)
			var id = x + y * 10 #just create some unique ID
			ts.create_tile(id)
			ts.tile_set_texture(id, texture)
			ts.tile_set_region(id, region)
	ResourceSaver.save("res://terrain/terrain_tiles.tres", ts)
	