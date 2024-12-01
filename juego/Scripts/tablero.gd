extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func cambiarValores(dist:Array, tir:int) -> void:
	if tir == 0:
		$Sprite2D/Derrota.text = "DESCALIFICADO"
	else:
		if dist.size() == 4:
			$Sprite2D/Distancias.text = "Distancias \n" + str(int(dist[0])) + "\n" + str(int(dist[1])) + "\n" + str(int(dist[2])) + "\n" + str(int(dist[3]))
		elif dist.size() == 3:
			$Sprite2D/Distancias.text = "Distancias \n" + str(int(dist[0])) + "\n" + str(int(dist[1])) + "\n" + str(int(dist[2]))
		
		var suma = 0
		for num in dist:
			suma += num
		$Sprite2D/Suma.text = str(int(suma))
		
		$Sprite2D/Multiplicador.text = "X " + str(tir)
		
		$Sprite2D/Total.text = str(int(suma * tir))
