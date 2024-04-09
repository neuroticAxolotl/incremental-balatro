extends TextureRect

# set by global function create_card()
var rank:int = 1
var suit = Global.Suits.SPADE

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func update_values():
	var children = get_children()
	var suit_icons = []
	var rank_labels = []
	
	for child in children:
		if child.name.begins_with("SuitIcon"):
			suit_icons.append(child)
		elif child.name.begins_with("RankLabel"):
			rank_labels.append(child)
	
	match rank:
		1:
			# set decoration here
			for label in rank_labels:
				label.text = "A"
	
	for node in suit_icons:
		node.texture = suit
