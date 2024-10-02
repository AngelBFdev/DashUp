extends Button

#@export var scene_path:String = "res://TestingScenes/dash_testing.tscn"
@export var scene_selected:PackedScene
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
    pass

func _on_pressed() -> void:
    if scene_selected:
        get_tree().change_scene_to_packed(scene_selected)
    else:
        print("No scene selected!")
