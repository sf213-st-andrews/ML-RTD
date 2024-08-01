extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$Hitbox/CollisionShape2D.disabled = false
	$Hitbox/AnimatedSprite2D.play("default")
	show()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _physics_process(_delta):
	pass

func start(input_position):
	position = input_position
	show()
	$Hitbox/CollisionShape2D.disabled = false
