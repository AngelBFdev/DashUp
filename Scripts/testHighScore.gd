extends Control



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    pass
    
func _process(_delta):
    pass
    
func _input(event: InputEvent):
    if event is InputEventMouseButton or event is InputEventScreenTouch:
        $high_score.increase_score()
