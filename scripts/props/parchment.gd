extends Node3D

signal show_note


func _ready() -> void:
    $StaticBody3D.input_event.connect(on_static_body_input_event)


func on_static_body_input_event(camera, event, position, normal, shape_idx) -> void:
    if event is InputEventMouseButton and event.pressed:
        show_note.emit()