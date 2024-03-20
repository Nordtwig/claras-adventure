extends Node3D

@export var is_lit: bool = false


func _ready() -> void:
	$Area3D.body_entered.connect(on_body_entered)
	$OmniLight3D.visible = is_lit


func _process(delta) -> void:
	if is_lit:
		await get_tree().create_timer(randf() * 2.0).timeout
		$AnimationPlayer.play("Flicker")


func _input(event):
	# if event.is_action_pressed("left_click"):
	# 	is_lit = !is_lit
	# 	$OmniLight3D.visible = is_lit
	pass


func switch(new_status: bool) -> void:
	is_lit = new_status


func on_body_entered(body: Node3D) -> void:
	if body.name == "Player":
		switch(true)
		$OmniLight3D.visible = is_lit

