extends HBoxContainer


func draw_cards(amount):
	for i in range(amount):
		var new_card = Global.create_random_card()
		add_child(new_card)
	

func _process(_delta):
	if get_child_count() == 0:
		draw_cards(8)
