extends Node

@export var rarities = {"Neutral": 500,
						"Bad": 250,
						"Good": 250}

var usable_events:Array = [Resource]

var rng = RandomNumberGenerator.new()

func get_rarity():
	rng.randomize()
	
	var weighted_sum = 0
	
	for n in rarities:
		weighted_sum += rarities[n]
		
	var item = rng.randi_range(0,weighted_sum)
	
	for n in rarities:
		if item <= rarities[n]:
			return n
		item -= rarities[n]
		
func random_event():
	$"../Game/EventPanel".visible = true
	
