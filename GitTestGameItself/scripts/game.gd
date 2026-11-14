extends Node2D

@onready var camera: Camera2D = %Camera2D
@onready var player = $Player
@onready var camera_capture = $camera_capture
@onready var room = $camera_capture/Room

var target = null

func _ready():
	target = player

func _process(delta):
	camera.set_position(player.get_position())

func _on_camera_capture_body_entered(body: Node2D) -> void:
	camera.set_position(room.get_position())
