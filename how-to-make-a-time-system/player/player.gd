extends CharacterBody2D

@export var speed: int = 30

@onready var animations: AnimationPlayer = $AnimationPlayer

var last_anim_direction: String = "left"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	handleInput()
	move_and_slide()
	updateAnimation()
	
	
func handleInput():
	velocity = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down") * speed
	

func updateAnimation():
	if velocity.length() == 0:
		animations.play("idle" + '_' +  last_anim_direction)
	else:
		var direction = last_anim_direction
		if velocity.x < 0: direction = "left"
		elif velocity.x > 0: direction = "right"
	
		animations.play("walk" + '_' +  direction)
		last_anim_direction = direction
