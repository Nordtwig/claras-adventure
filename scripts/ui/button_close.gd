extends Button

@export var audio_stream: AudioStreamPlayer


func _ready() -> void:
    pressed.connect(on_pressed)


func on_pressed() -> void:
    audio_stream.play()
    get_parent().visible = false