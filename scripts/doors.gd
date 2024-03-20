extends Node3D


func _ready() -> void:
	$Area3D.body_entered.connect(on_body_entered)



func on_body_entered(body: Node3D) -> void:
	if body.name != "Player":
		return
	
	if body.has_key:
		$Open.play()
		$AnimationPlayer.play("Open")
		body.has_key = false
	else: 
		$Locked.play()