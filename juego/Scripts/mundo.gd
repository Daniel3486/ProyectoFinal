extends Node2D

const escenaTablero = "res://Escenas/tablero.tscn"
const nivel2 = "res://Escenas/mundo_2.tscn"

var cambio:bool = false

"""
var disparado = false
var compensacion = 90

var velocidad = 2000
"""
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var disparo = Input.is_action_just_pressed("Disparo")
	
	if disparo and cambio:
		get_tree().change_scene_to_file(nivel2)
	
"""
func _physics_process(delta: float) -> void:
	var disparo = Input.is_action_just_pressed("Disparo")
	
	if disparo and not disparado:
		disparado = true
		
		var y = $"cañon".rotation_degrees/-90
		var x = 1 - y
		var diferenciaX = compensacion * x
		var diferenciaY = compensacion * y
		
		$jabalina.position = Vector2($"cañon".position.x + diferenciaX, $"cañon".position.y - diferenciaY - 12)
		$jabalina.rotation_degrees = $"cañon".rotation_degrees
		
		var velocity_x = cos($jabalina.rotation) * (velocidad + $"cañon".velocity.x)
		var velocity_y = sin($jabalina.rotation) * velocidad
		
		$jabalina.linear_velocity = Vector2(velocity_x, velocity_y)
	"""


func _on_canvas_layer_tablero(dist: Array, tir: int) -> void:
	var tablero = preload(escenaTablero).instantiate()
	tablero.cambiarValores(dist, tir)
	add_child(tablero)
	if tir == 0:
		$Tiempo.queue_free()
		$"cañon".queue_free()
		$lanzador.queue_free()
	cambio = true
	
