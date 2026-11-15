extends Node2D
class_name Door

@export var room_name: String
@export var player_point_name: String

func change_room(room: String, player_point_name: String) -> void:
	SignalManager.emit_signal("room_changed", room, player_point_name)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		change_room(room_name, player_point_name)
