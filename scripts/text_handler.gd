extends Node

@export var money_label: Label



@onready var world: Node2D = $".."
@onready var family_status_handler: Node = $"../FamilyStatusHandler"


func _on_world_money_update() -> void:
	money_label.text = "%d$" % world.player_money
