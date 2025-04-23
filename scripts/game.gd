extends Node2D

var player_money: int = 0

signal money_update

var player_inventory: Dictionary = {
	"pasta": 0,
	"canned_beans": 0,
	"water": 0,
	"electricity": 0,
	"meat": 0,
	"rat_poison": 0,
	"medicine": 0
}

var market_items: Dictionary = {
	"pasta": 10,
	"canned_beans": 15,
	"water": 30,
	"electricity": 25,
	"meat": 40,
	"rat_poison": 50,
	"medicine": 35
}

func _ready() -> void:
	money_update.emit()

func money_earn(x):
	player_money += x
	money_update.emit()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		money_earn(1000)

func _on_book_open_pressed() -> void:
	$Game/Book.visible = true

func _on_exit_book_pressed() -> void:
	$Game/Book.visible = false

func _on_exit_event_pressed() -> void:
	$Game/EventPanel.visible = false
