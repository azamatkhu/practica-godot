extends Node
class_name Main

@export var player: Player

@export var interaction_radius: float = 12.0

@export var left_limit: float = 0
@export var right_limit: float = 640

var current_room: Room = null
var player_point: Node2D = null

var score: int = 0
var playing: bool = true

func _ready() -> void:
	SignalManager.room_changed.connect(_on_room_changed)
	
	Global.player = $Player
	current_room = $Room_0
	current_room.show()
	current_room.process_mode = Node.PROCESS_MODE_INHERIT

func _process(delta: float) -> void:
	var enemies = get_tree().get_nodes_in_group("enemy").size()
	if enemies <= 0:
		get_tree().change_scene_to_file("res://win.tscn")

func _on_room_changed(room: String, point: String) -> void:
	current_room.hide()
	current_room.process_mode = Node.PROCESS_MODE_DISABLED
	
	current_room = get_node_or_null(room)
	current_room.show()
	current_room.process_mode = Node.PROCESS_MODE_INHERIT
	
	player_point = current_room.get_node_or_null(point)
	player.global_position = player_point.global_position
	
