class_name cañon
extends CharacterBody2D

@export var friccion = 1000
@export var aceleracion = 400
@export var velocidadMaxima = 2000
@export var velocidadInicial = 150

@export var velocidadRotacion = 120

#var disparado:bool = false
var permitido:bool = true

signal lanzar(pos:Vector2, vel:float, rot:float)
signal cambiarCamara()

func _physics_process(delta: float) -> void:

	var derecha = Input.is_action_pressed("Derecha")
	var izquierda = Input.is_action_pressed("Izquierda")
	var arriba = Input.is_action_pressed("Arriba")
	var abajo = Input.is_action_pressed("Abajo")
	
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
	
	if arriba: #and permitido:
		if rotation_degrees - velocidadRotacion * delta >= -60:
			rotation_degrees -= velocidadRotacion * delta
		else:
			rotation_degrees = -60
	elif abajo: #and permitido:
		if rotation_degrees + velocidadRotacion * delta <= 0:
			rotation_degrees += velocidadRotacion * delta
		else:
			rotation_degrees = 0
	
	var disparo = Input.is_action_just_pressed("Disparo")
	
	if disparo: #and not disparado:
		#disparado = true
		emit_signal("lanzar", global_position, velocity.x, rotation_degrees)
		emit_signal("cambiarCamara")
	
	move_and_slide()


func _on_detector_area_entered(area: Area2D) -> void:
	permitido = false
