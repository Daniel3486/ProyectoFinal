extends Node2D

const escenaTablero = "res://Escenas/tablero.tscn"
const nivel3 = "res://Escenas/mundo_3.tscn"

var cambio:bool = false

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var disparo = Input.is_action_just_pressed("Disparo")
	
	if disparo and cambio:
		get_tree().change_scene_to_file(nivel3)


func _on_canvas_layer_tablero(dist: Array, tir: int) -> void:
	var tablero = preload(escenaTablero).instantiate()
	tablero.cambiarValores(dist, tir)
	add_child(tablero)
	if tir == 0:
		$Tiempo.queue_free()
		$"cañon".queue_free()
		$lanzador.queue_free()
	cambio = true
	
