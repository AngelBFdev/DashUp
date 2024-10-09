extends Control



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    pass
    
func _process(_delta):
    pass
    
func _input(event: InputEvent):
    if Input.is_action_just_pressed("Left_Click") or event is InputEventScreenTouch:
        $high_score.increase_score()
