extends Control





func _on_jugar_pressed() -> void:
	get_tree().change_scene_to_file("res://MyAssets/Scenas/game.tscn")


func _on_instrucciones_pressed() -> void:
	get_tree().change_scene_to_file("res://MyAssets/instrucciones.tscn")
	
func _on_salir_pressed() -> void:
	get_tree().quit()
	
