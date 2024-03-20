extends Node3D

signal note_pressed

@export var parchment_scene: Node
@export var door: Node


func _ready() -> void:
	parchment_scene.show_note.connect(on_parchment_show_note)
	door.door_opened.connect(on_door_opened)


func on_parchment_show_note() -> void:
	note_pressed.emit()


func on_door_opened() -> void:
	print("I heard the door opening from Maine")
