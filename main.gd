extends Node

onready var root = get_tree().root

const OFFLINE = 2


# Called when the node enters the scene tree for the first time.
func _ready():
	root.connect("child_entered_tree", self, "_on_enter")


func _on_enter(node: Node):
	if node.name == "main_menu":
		yield (get_tree().create_timer(1.0), "timeout")
		Network._create_custom_lobby(OFFLINE)
