extends Node2D

var posicionInicial:Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	posicionInicial = position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$TextureRect/Label.text = "Distancia: " + str(int(position.distance_to(posicionInicial)))


func _on_jabalina_posicion(posicion: float) -> void:
	if position.x <= posicion:
		position.x = posicion
