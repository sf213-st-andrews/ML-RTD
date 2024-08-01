extends CharacterBody2D

# signal k_hit

@export var speed = 50
@export var health = 100 #100
@export var damage = 25

@onready var animation_tree : AnimationTree = $AnimationTree
# @onready var knight_state_machine : KnightStateMachine = $KStateMachine

@onready var ready_to_swing = true

var direction
var screen_size


var building_array = []
# Called when the node enters the scene tree for the first time.
func _ready():
	$HitboxShape.disabled = false
	$Hurtbox/HurtboxShape.disabled = false
	animation_tree.active = true
	
	velocity		= Vector2.ZERO
	screen_size		= get_viewport_rect().size
	direction		= Vector2(0,-1)
	# ready_to_swing	= true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	# Refactor and make it more efficient and not resource intensive.
	if (!ready_to_swing):
		$AnimatedSprite2D.play("attack")
		return
	if (velocity != Vector2.ZERO):
		$AnimatedSprite2D.play("idle_down")
		return
	# if (velocity.x ):
	# 	pass
	
	


func _physics_process(delta):
	if (!building_array.is_empty() && ready_to_swing):
		preform_attack()
		# Insert Damage stuff
	
	velocity = direction * speed 
	move_and_collide(velocity * delta)
	# Come Back and try to make use of the CharacterBody2D
	# position += velocity * delta
	
	position = position.clamp(Vector2.ZERO, screen_size)

func update_animation():
	# 0 should be replaced by ready_to_swing?
	animation_tree.set("parameters/Attack/blend_position", 0)

func damage_knight(damage_taken):
	health -= damage_taken
	if (health <= 0):
		queue_free()

# Detect Buildings to Damage
func _on_hurtbox_body_entered(body):
	building_array.append(body)

func _on_hurtbox_body_exited(body):
	building_array.erase(body)

func preform_attack():
	ready_to_swing = false
	for i in building_array.size():
		building_array[i].damage_building(damage)
	

func _on_swing_timer_timeout():
	ready_to_swing = true
