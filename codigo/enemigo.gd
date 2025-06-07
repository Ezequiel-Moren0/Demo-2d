extends CharacterBody2D

@onready var pajaro: AnimatedSprite2D = $Pajaro
@onready var ray_cast_2_derecha: RayCast2D = $ray_cast_2_derecha
@onready var ray_cast_2_izquierda: RayCast2D = $ray_cast_2_izquierda

var direccion: int = -1
const VELOCIDAD: float = 100.0

var detenido: bool = false
var tiempo_espera: float = 0.0
const TIEMPO_ESPERA_SEGUNDOS: float = 0.3

func _process(delta: float) -> void:
	# Lógica de colisión con paredes
	if ray_cast_2_derecha.is_colliding() or ray_cast_2_izquierda.is_colliding():
		if not detenido:
			tiempo_espera = 0
			detenido = true
		else:
			tiempo_espera += delta
			if tiempo_espera >= TIEMPO_ESPERA_SEGUNDOS:
				if ray_cast_2_derecha.is_colliding():
					direccion = -1
				elif ray_cast_2_izquierda.is_colliding():
					direccion = 1
				detenido = false
	else:
		detenido = false

	# Movimiento horizontal
	if not detenido:
		var velocidad: Vector2 = Vector2(direccion * VELOCIDAD, 0)
		velocity = velocidad
	else:
		velocity = Vector2.ZERO

	move_and_slide()#Metodo que usamos para que el pajaro pueda rotar al collisionar

	# Actualiza flip_h según dirección
	pajaro.flip_h = (direccion == 1)
