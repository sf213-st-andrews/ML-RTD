extends StaticBody2D

@export var health = 100# 400

# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite2D.show()
	show()
	$Hitbox/CollisionShape2D.disabled = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _physics_process(_delta):
	pass

func damage_building(damage_taken):
	health -= damage_taken
	if (health <= 0):
		queue_free()
