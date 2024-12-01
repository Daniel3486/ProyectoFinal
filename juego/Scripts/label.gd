extends CanvasLayer

var tiempo:int = 60
var potencia:float = 1000
var tiros:int = 6

signal tablero(dist:Array, tir:int)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_tiempo_timeout() -> void:
	"""
	tiempo += 1
	if tiempo < 60:
		$Label.text = "Tiempo: " + str(tiempo)
	else:
		if tiempo%60 < 10:
			$Label.text = "Tiempo: " + str(tiempo/60) + ":0" + str(tiempo%60)
		else:
			$Label.text = "Tiempo: " + str(tiempo/60) + ":" + str(tiempo%60)
	"""
	tiempo -= 1
	if tiempo == 0:
		emit_signal("tablero", [], 0)
	$Label.text = "Tiempo: " + str(tiempo)


func _on_jabalina_label(pot: float) -> void:
	var potFinal:int = int(pot)
	var tween:Tween = get_tree().create_tween().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	
	tween.tween_method(cambiarPotencia, potencia, potFinal, 0.5)
	
	tiros -= 1
	if tiros == 0:
		emit_signal("tablero", [], 0)
	$Tiros.text = "Tiros: " + str(tiros)

func cambiarPotencia(potencia:int) -> void:
	$Potencia.text = "Potencia: " + str(potencia)


func _on_jabalina_tablero(dist: Array) -> void:
	emit_signal("tablero", dist, tiros)
