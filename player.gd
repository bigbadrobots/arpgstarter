extends CharacterBody2D

@export var speed:float = 100
@export var accel:float = 10

@onready var anim_sprite: AnimatedSprite2D = $AnimatedSprite2D as AnimatedSprite2D

var last_direction:Vector2 = Vector2.ZERO

func _physics_process(delta):
	var direction: Vector2 = Input.get_vector("left","right","up","down")
	
	velocity.x = move_toward(velocity.x, speed * direction.x,accel)
	velocity.y = move_toward(velocity.y, speed * direction.y,accel)
	
	if direction != Vector2.ZERO:
		last_direction = direction
	
	if direction.x != 0:
		anim_sprite.play("walk_right")
	elif direction.y < 0:
		anim_sprite.play("walk_up")
	elif direction.y > 0:
		anim_sprite.play("walk_down")
	else:
		if last_direction.x != 0:
			anim_sprite.play("idle_right")
		elif last_direction.y < 0:
			anim_sprite.play("idle_up")
		elif direction.y > 0:
			anim_sprite.play("idle_down")
	
	anim_sprite.flip_h = last_direction.x < 0		
	move_and_slide()
