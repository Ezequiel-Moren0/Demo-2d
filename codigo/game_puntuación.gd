extends Node
var puntuacion = 0

@onready var etiqueta_puntuacion: Label = $EtiquetaPuntuacion



func puntuacion_incrementa(): #incrementamos la puntuación
	
	puntuacion += 1

	etiqueta_puntuacion.text ="Has obtenido\n"+str(puntuacion)+" monedas."
	#cambiamos la etiqueta y agregamos la puntuacion
