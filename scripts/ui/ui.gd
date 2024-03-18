extends CanvasLayer

@export var main: Node3D


func _ready() -> void:
    main.note_pressed.connect(on_main_note_pressed)


func on_main_note_pressed() -> void:
    $Panel.visible = true