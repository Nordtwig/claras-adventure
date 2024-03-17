extends Node3D

@export var is_lit: bool = false


func _input(event):
	if event.is_action_pressed("left_click"):
		is_lit = !is_lit
		$OmniLight3D.visible = is_lit


func switch(new_status: bool) -> void:
	is_lit = new_status
