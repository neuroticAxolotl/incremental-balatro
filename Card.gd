extends TextureRect

# set by global function create_card()
var rank = 1
var suit = "spade"
var face_down = false

# Called when the node enters the scene tree for the first time.
func _ready():
	update_values()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func update_values():
	var suit_icons = []
	var rank_labels = []
	var decorations = []
	
	# get child nodes that need to display suit & rank
	for child in get_children():
		if child.name.begins_with("SuitIcon"):
			suit_icons.append(child)
		elif child.name.begins_with("RankLabel"):
			rank_labels.append(child)
		elif child.name.begins_with("Decoration"):
			decorations.append(child)
			# hide visible decorations in case the card is being changed rather than created
			child.visible = false 
			for grandchild in child.get_children():
				if grandchild.name.begins_with("SuitIcon"):
					suit_icons.append(grandchild)
				elif grandchild.name.begins_with("RankLabel"):
					rank_labels.append(grandchild)
	
	var visible_decoration = decorations[rank-1]
	visible_decoration.visible = true
	
	if rank in [1]:
		match suit:
			"spade":
				visible_decoration.find_child("Spade").visible = true
			"heart":
				visible_decoration.find_child("Heart").visible = true
			"club":
				visible_decoration.find_child("Club").visible = true
			"diamond":
				visible_decoration.find_child("Diamond").visible = true
			
	
	for label in rank_labels:
		if rank == 1:
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
	
	if face_down:
		$CardBack.visible = true
	else:
		$CardBack.visible = false
