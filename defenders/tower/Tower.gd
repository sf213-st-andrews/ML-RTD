extends StaticBody2D

# signal t_hit
# signal tower_fires(missile_scene, direction, location)

@export var health = 50# 200

@export var missile_scene: PackedScene

@onready var ready_to_fire = true
var enemy_array = []

# Called when the node enters the scene tree for the first time.
func _ready():
	$CollisionShape2D.disabled = false
	$Range/CollisionShape2D.disabled = false
	
	$TowerSprite2D.show()
	# For Debugging
	# knight_detected.emit(missile_scene, Vector2(0, 1), Vector2(200, 32))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _physics_process(_delta):
	if (!enemy_array.is_empty() && ready_to_fire):
		launch_missile(enemy_array[0].position)#fix

func launch_missile(target_position):
	var direction = (target_position - position).normalized()
	var missile = missile_scene.instantiate()
	missile.launch(direction, direction * 48)
	add_child(missile)
	ready_to_fire = false
	$Range/Reload.start()
	$BallistaAniSprite2D.play()
	$BallistaAniSprite2D.rotate(direction.angle())

func _on_range_body_entered(body):
	enemy_array.append(body)

func _on_range_body_exited(body):
	enemy_array.erase(body)

func _on_reload_timeout():
	ready_to_fire = true
	$BallistaAniSprite2D.pause()
	$BallistaAniSprite2D.set_frame_and_progress(0, 0)

func damage_building(damage_taken):
	health -= damage_taken
	if (health <= 0):
		queue_free()



