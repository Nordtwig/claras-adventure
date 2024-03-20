extends Node3D

signal note_pressed

@export var parchment_scene: Node
@export var door: Node


func _ready() -> void:
	parchment_scene.show_note.connect(on_parchment_show_note)
	door.door_opened.connect(on_door_opened)


func change_level() -> void:
	var new_level = load("res://scenes/levels/level_2.tscn").instantiate()

	$Level.get_child(0).queue_free()
	$Level.add_child(new_level)


func on_parchment_show_note() -> void:
	note_pressed.emit()


func on_door_opened() -> void:
	change_level()
