extends "res://scripts/props/candles/candle.gd"


func _ready() -> void:
	$Area3D.body_entered.connect(on_body_entered)
	$OmniLight3D.visible = is_lit
	$Flame.visible = is_lit


func on_body_entered(body: Node3D) -> void:
	if body.name == "Player":
		switch(true)
		$Flame.visible = is_lit
		$OmniLight3D.visible = is_lit
