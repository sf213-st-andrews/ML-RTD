extends Node2D

# signal m_hit

@export var speed = 100# 100
@export var damage = 10# 10


var velocity = Vector2.ZERO
# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play()
	$Hurtbox/CollisionShape2D.disabled = false
	$Hurtbox.monitoring = true
	rotate(velocity.angle())

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _physics_process(delta):
	position += velocity * delta

func launch(direction, location):
	velocity = direction * speed
	position = location

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_hurtbox_body_entered(body):
	body.damage_knight(damage)
