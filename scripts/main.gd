extends Node3D

signal note_pressed

@export var parchment_scene: Node


func _ready() -> void:
	parchment_scene.show_note.connect(on_parchment_show_note)


func on_parchment_show_note() -> void:
	note_pressed.emit()
