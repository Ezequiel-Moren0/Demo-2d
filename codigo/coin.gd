extends Area2D

@onready var sonido_moneda: AudioStreamPlayer2D = $sonidoMoneda
@onready var game_puntuación: Node = %"Game-Puntuación" 
#Instanciamos game_puntuación en coin para poder acceder al nodo coin 
#Y ahora coin tiene acceso a game_puntuación
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D


func _on_body_entered(body: Node2D) -> void: #Funcion para que el cuerpo choque y detecte la moneda
	game_puntuación.puntuacion_incrementa()#Metodo para que el objeto se borre
	sonido_moneda.play()
	animated_sprite_2d.visible = false
	collision_shape_2d.disabled = true
	collision_shape_2d.call_deferred("set", "disabled" ,true)
	#Se desactiva la collision y la moneda despues de agarrarla
	

	#Borramos la moneda despues de escuchar el sonido
func _on_sonido_moneda_finished() -> void:
	queue_free()
