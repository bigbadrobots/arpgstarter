extends CharacterBody2D

@export var speed:float = 100
@export var accel:float = 10

@onready var anim_sprite: AnimatedSprite2D = $AnimatedSprite2D as AnimatedSprite2D

func _physics_process(delta):
	var direction: Vector2 = Input.get_vector("left","right","up","down")
	
	velocity.x = move_toward(velocity.x, speed * direction.x,accel)
	velocity.y = move_toward(velocity.y, speed * direction.y,accel)
	
	move_and_slide()
