extends Node

var card_scene = preload("res://card.tscn")

enum Suits {SPADE, HEART, CLUB, DIAMOND}
var suit_icons = {Suits.SPADE: preload("res://spade.tres")}



func CreateCard(suit, rank):
	var new_card = card_scene.instantiate()
	new_card.rank = rank
	new_card.suit = suit
	new_card.update_values()
