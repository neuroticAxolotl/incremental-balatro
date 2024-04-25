extends Node

var card_scene = preload("res://card.tscn")

var suits = ["spade", "heart", "club", "diamond"]

var suit_icons = {
		"spade": preload("res://spade.tres"), 
		"heart": preload("res://heart.tres"), 
		"club": preload("res://club.tres"), 
		"diamond": preload("res://diamond.tres"),
	}

var suit_colors = {
		"spade": Color("000000"), 
		"heart": Color("ff0000"), 
		"club": Color("404b4f"), 
		"diamond": Color("ff7800"),
	}

var deck = []
var discard = []

func _ready():
	pass

func create_card(suit, rank, face_down = false):
	var new_card = card_scene.instantiate()
	new_card.rank = rank
	new_card.suit = suit
	new_card.update_values()
	return new_card

func create_random_card():
	var random_suit = suits[randi_range(0,3)]
	var random_rank = randi_range(1,13)
	return create_card(random_suit, random_rank)
	
