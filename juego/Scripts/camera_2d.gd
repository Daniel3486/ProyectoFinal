extends Camera2D

@onready var objetoSeguir:Node2D = $"../lanzador"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position = objetoSeguir.position


func _on_jabalina_camara_jabalina() -> void:
	objetoSeguir = $"../jabalina"


func _on_jabalina_camara_lanzador() -> void:
	objetoSeguir = $"../lanzador"
