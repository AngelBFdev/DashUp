extends Node2D

const NUM_PLATFORMS:int = 5

@export var platform_scene := preload("res://Components/platform.tscn")

var x_position: float = 181
var y_increment: int = -100
var current_y: int = 600
var platforms: Array = []
var max_length: int = 65
var random_length: int = max_length
var platform

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    randomize()
    for i in range(NUM_PLATFORMS):
        var platform_instance = platform_scene.instantiate()
        add_child(platform_instance)
        _create_platform(platform_instance)
        platforms.append(platform_instance)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
    if !platforms[0].is_visible:
        platform = platforms.pop_front()
        _create_platform(platform)
        platform.is_visible = true
        platforms.append(platform)

func _create_platform(platform_instance: TileMapLayer):
    var random_num = randi() % random_length
    print(random_num)
    platform_instance.generate_platform(random_num)
    platform_instance.position = Vector2(x_position,current_y)
    current_y += y_increment
    if random_length == 1:
        max_length -= 1
        random_length = max_length
    else:
        random_length -= 1
