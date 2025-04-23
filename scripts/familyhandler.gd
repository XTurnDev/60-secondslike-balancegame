extends Node


@onready var world: Node2D = $".."

var family_health = {"son":100,
					"wife":100,
					"daughter":100}

var family_status: Dictionary = {"son": 1,
					"wife":1,
					"daughter":1}

@export var wife_status: Label
@export var wife_health: Label
@export var son_status: Label
@export var son_health: Label
@export var daughter_status: Label
@export var daughter_health: Label


signal day_change
signal status_changed
signal health_changed

func _ready() -> void:
	status_changed.emit()
	health_changed.emit()

func take_damage(damage, member):
	family_health[member] -= damage
	health_changed.emit()
	
func status_effect(status, member_status):
	family_status[member_status] = status
	status_changed.emit()

func _on_day_change() -> void:
	for i in family_status:
		if i == 1:
			pass
		elif i == 0:
			if world.player_inventory["medicine"] > 0:
				i == 1
			else:
				take_damage(10, i)
		elif i == -1:
			take_damage(50, i)


func _on_status_changed() -> void:
	if family_status["wife"] == 1:
		wife_status.text = "Healty"
	elif family_status["wife"] == 0:
		wife_status.text = "Sick"
	elif family_status["wife"] == -1:
		wife_status.text = "Very Sick"
	
	if family_status["son"] == 1:
		son_status.text = "Healty"
	elif family_status["son"] == 0:
		son_status.text = "Sick"
	elif family_status["son"] == -1:
		son_status.text = "Very Sick"
	
	if family_status["daughter"] == 1:
		daughter_status.text = "Healty"
	elif family_status["daughter"] == 0:
		daughter_status.text = "Sick"
	elif family_status["daughter"] == -1:
		daughter_status.text = "Very Sick"


func _on_health_changed() -> void:
	wife_health.text = "%d" % family_health["wife"]
	son_health.text = "%d" % family_health["son"]
	daughter_health.text = "%d" % family_health["daughter"]
