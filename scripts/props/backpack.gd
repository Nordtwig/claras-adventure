extends Node3D

var key_collected: bool = false


func _ready() -> void:
	$Area3D.body_entered.connect(on_body_entered)


func on_body_entered(body: Node3D) -> void:
	if body.name == "Player" and !key_collected:
		$AudioStreamPlayer.play()
		key_collected = true
		body.has_key = key_collected
