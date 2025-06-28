extends Node
var puntuacion = 0
var tiempo_restante = 90
@onready var etiqueta_puntuacion: Label = $EtiquetaPuntuacion
@onready var etiqueta_temporizador: Label = $"../CanvasLayer/Temporizador"


func _process(delta):
	if tiempo_restante > 0:
		tiempo_restante -= delta
		etiqueta_temporizador.text = "Tiempo restante: %d" % [tiempo_restante]

	if tiempo_restante <= 0:
		mostrar_game_over()

func mostrar_game_over():
	etiqueta_temporizador.text = "Se acabó el tiempo"
	get_tree().create_timer(2.0).connect("timeout", Callable(self, "reiniciar_juego"))

func reiniciar_juego():
	get_tree().reload_current_scene() #Reinicia el juego


func puntuacion_incrementa(): #incrementamos la puntuación
	
	puntuacion += 1

	etiqueta_puntuacion.text ="Has obtenido\n"+str(puntuacion)+" monedas."
	#cambiamos la etiqueta y agregamos la puntuacion
