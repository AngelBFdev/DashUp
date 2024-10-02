extends TileMapLayer

const PIXELS: int = 8

var tiles: int
var last_tile: int
var total_tiles: int
var random_tile: int
var collision_shape: RectangleShape2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    randomize()
    generate_platform()  
    pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
    pass

func generate_platform(platform_length: int = 65):
    tiles = platform_length / PIXELS
    last_tile = platform_length % PIXELS
    total_tiles = tiles + 1 if last_tile else tiles
    for i in range(total_tiles):
        random_tile = randi() % 4
        if last_tile and i == total_tiles-1:
            if last_tile < 3:
                random_tile = 0
            elif last_tile == 3:
                random_tile = randi() % 2
            set_cell(Vector2(i, 0), 0, Vector2i(last_tile - 1, random_tile))
        else:
            set_cell(Vector2(i, 0), 0, Vector2i(PIXELS - 1, random_tile))
    _update_collision_shape(platform_length)

func _update_collision_shape(platform_length: float):
    collision_shape = $CharacterBody2D/CollisionShape2D.shape
    collision_shape.set_size(Vector2(platform_length, PIXELS))
    $CharacterBody2D/CollisionShape2D.position = Vector2(platform_length,PIXELS)/2
