extends Node

var card_scene = preload("res://card.tscn")

enum Suits {SPADE, HEART, CLUB, DIAMOND}

var suit_icons = {
	Suits.SPADE: preload("res://spade.tres"), 
	Suits.HEART: preload("res://heart.tres"), 
	Suits.CLUB: preload("res://club.tres"), 
	Suits.DIAMOND: preload("res://diamond.tres"),
	}

var suit_colors = {
	Suits.SPADE: Color("000000"), 
	Suits.HEART: Color("ff0000"), 
	Suits.CLUB: Color("404b4f"), 
	Suits.DIAMOND: Color("ff7800"),
	}


func CreateCard(suit, rank):
	var new_card = card_scene.instantiate()
	new_card.rank = rank
	new_card.suit = suit
	new_card.update_values()
