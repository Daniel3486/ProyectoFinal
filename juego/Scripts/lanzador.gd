class_name lanzador
extends CharacterBody2D

#@export var SPEED = 300.0
@export var aceleracion = 1500
@export var friccion = 1000
@export var velocidadMaxima = 5000
@export var velocidadInicial = 100
#const JUMP_VELOCITY = -400.0

var permitido:bool = true

func _physics_process(delta: float) -> void:
	# Add the gravity.
	#if not is_on_floor():
	#	velocity += get_gravity() * delta

	# Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
	#	velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	'''
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		if velocity.x == 0:
			velocity.x = direction * velocidadInicial
		else:
			if velocity.x * direction * aceleracion * delta > velocidadMaxima:
				velocity.x = velocidadMaxima
			elif velocity.x * direction * aceleracion * delta < velocidadMaxima * -1:
				velocity.x = velocidadMaxima * -1
			else:
				velocity.x += direction * aceleracion * delta
	else:
		velocity.x = move_toward(velocity.x, 0, friccion * delta)
	'''
	
	var derecha = Input.is_action_pressed("Derecha")
	var izquierda = Input.is_action_pressed("Izquierda")
	
	if derecha and permitido:
		if velocity.x == 0:
			velocity.x = velocidadInicial
		elif velocity.x < 0:
			velocity.x = move_toward(velocity.x, 0, aceleracion * delta + friccion * delta)
		elif velocity.x + aceleracion * delta > velocidadMaxima:
			velocity.x = velocidadMaxima
		else:
			velocity.x += aceleracion * delta
	elif izquierda and permitido:
		if velocity.x == 0:
			velocity.x = -velocidadInicial
		elif velocity.x > 0:
			velocity.x = move_toward(velocity.x, 0, aceleracion * delta + friccion * delta)
		elif velocity.x - aceleracion * delta < -velocidadMaxima:
			velocity.x = -velocidadMaxima
		else:
			velocity.x -= aceleracion * delta
	else:
		velocity.x = move_toward(velocity.x, 0, friccion * delta)

	move_and_slide()


func _on_detector_area_entered(area: Area2D) -> void:
	permitido = false
