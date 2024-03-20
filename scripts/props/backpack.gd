extends Node3D

signal key_collected


func _ready() -> void:
	$Area3D.body_entered.connect(on_body_entered)


func on_body_entered(body: Node3D) -> void:
	if body.name == "Player":
		$AudioStreamPlayer.play()
		key_collected.emit()
		body.has_key = true
