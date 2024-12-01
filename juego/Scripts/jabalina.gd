class_name jabalina
extends RigidBody2D

var compensacion = 90
var velocidad:float = 1000
var enElSuelo:bool = true
var tirar:bool = true

var distancias = []

signal posicion(posicion:float)
signal camaraJabalina()
signal camaraLanzador()
signal label(pot:float)
signal tablero(dist:Array)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
		"""
		var y = $"cañon".rotation_degrees/-90
		var x = 1 - y
		var diferenciaX = compensacion * x
		var diferenciaY = compensacion * y
		
		$jabalina.position = Vector2($"cañon".position.x + diferenciaX, $"cañon".position.y - diferenciaY - 12)
		$jabalina.rotation_degrees = $"cañon".rotation_degrees
		
		var velocity_x = cos($jabalina.rotation) * (velocidad + $"cañon".velocity.x)
		var velocity_y = sin($jabalina.rotation) * velocidad
		
		$jabalina.linear_velocity = Vector2(velocity_x, velocity_y)"""
			# Obtener la velocidad actual del objeto
		emit_signal("posicion", position.x)
		
		var velocity = linear_velocity

		# Solo ajustar si la velocidad es suficientemente alta para evitar giros erráticos
		if velocity.length() > 0.1: #and enElAire:
			# Convertir la dirección de la velocidad en un ángulo
			var angle = velocity.angle()

			# Ajustar la rotación del objeto a ese ángulo
			rotation = angle
		
		if position.x > 5120:
			emit_signal("tablero", distancias)

func _on_cañon_lanzar(pos: Vector2, vel: float, rot: float) -> void:
	if enElSuelo and tirar:
		emit_signal("camaraJabalina")
		tirar = false
		enElSuelo = false
		var y = rot/-90
		var x = 1 - y
		var diferenciaX = compensacion * x
		var diferenciaY = compensacion * y
		
		global_position = Vector2(pos.x + diferenciaX, pos.y - diferenciaY - 12)
		print(global_position)#IMPORTANTE
		rotation_degrees = rot
		
		var velocity_x = cos(rotation) * (velocidad + vel)
		var velocity_y = sin(rotation) * velocidad
		apply_impulse(Vector2(velocity_x, velocity_y), Vector2(0,0))
	elif enElSuelo:
		emit_signal("camaraLanzador")
		tirar = true


func _on_suelo_falso_body_entered(body: Node2D) -> void:
	enElSuelo = true
	sleeping = true
	velocidad += position.x/10
	emit_signal("label", velocidad)
	distancias.append(position.x)
