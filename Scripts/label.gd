extends Label

var penalty_amount:int = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    pass
     
func increase_score(points: int = 100):
    $Timer.start() 
    Global.Score += points
    
      
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
    $".".text = str(Global.Score)
         
func decrease_on_timer() -> void:
    if Global.Score <= 0:
        $Timer.stop()
    else:
        Global.Score -= penalty_amount
        $Timer.start()
