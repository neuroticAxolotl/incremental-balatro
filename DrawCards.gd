extends HBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(5):
		var new_card = Global.create_random_card()
		add_child(new_card)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
