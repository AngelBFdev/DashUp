extends CharacterBody2D

const TELEPORT_HEIGHT = 100

func _input(event: InputEvent) -> void:
	if is_on_floor() and (event is InputEventMouseButton or event is InputEventScreenTouch) and event.is_pressed():
		_teleport_up()

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	move_and_slide()

func _teleport_up():
	position.y -= TELEPORT_HEIGHT
