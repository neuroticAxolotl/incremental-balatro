extends TextureRect

# set by global function create_card()
var rank:int = 6
var suit = Global.Suits.CLUB

# Called when the node enters the scene tree for the first time.
func _ready():
	update_values()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func update_values():
	var suit_icons = []
	var rank_labels = []
	
	# get child nodes that need to display suit & rank
	for child in get_children():
		if child.name.begins_with("SuitIcon"):
			suit_icons.append(child)
		elif child.name.begins_with("RankLabel"):
			rank_labels.append(child)
		elif child.name.begins_with("Decoration"):
			for grandchild in child.get_children():
				if grandchild.name.begins_with("SuitIcon"):
					suit_icons.append(grandchild)
	
	for label in rank_labels:
		if rank == 1:
			# set decoration here
			label.text = "A"
		if rank > 1 and rank < 11:
			label.text = str(rank)
		if rank == 11:
			label.text = "J"
		if rank == 12:
			label.text = "Q"
		if rank == 13:
			label.text = "K"
		
		label.label_settings.font_color = Global.suit_colors[suit]

	for node in suit_icons:
		node.texture = Global.suit_icons[suit]

