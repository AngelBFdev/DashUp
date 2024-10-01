extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    pass
    
func _process(_delta):
    $Label4.text = str(Global.Score)
    

func _input(event: InputEvent):
    if Input.is_action_just_pressed("Left_Click") or event is InputEventScreenTouch:
        $Hurry.start()
        Global.Score += 100

func _on_hurry_timeout() -> void:
    if Global.Score <= 0:
        $Hurry.stop()
    else:
        Global.Score -= 50
        $Hurry.start()
