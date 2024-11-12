extends CanvasLayer

var currentItem = 0;
var select = 0;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_close_pressed() -> void:
	$"../Shop".visible = false

func switch_item(select):
	for item in GlobalItems.items:
		if select == item:
			currentItem = select
			$Control/Name.text = GlobalItems.items[currentItem]["Name"]
			$Control/Sprite2D.texture = GlobalItems.items[currentItem]["icon"]
			$Control/Description.text = GlobalItems.items[currentItem]["Description"]
			$Control/Description.text += "\nCost: " + str(GlobalItems.items[currentItem]["Cost"])
			
func _on_previous_pressed() -> void:
	switch_item(currentItem - 1)


func _on_next_pressed() -> void:
	switch_item(currentItem + 1)


func _on_buy_pressed() -> void:
	var hasItem = false
	for item in GlobalItems.inventory:
		if GlobalItems.inventory[item]["Name"] == GlobalItems.items[currentItem]["Name"]:
			GlobalItems.inventory[item]["Count"] += 1
			hasItem = true;
	if hasItem == false:
		var tempDict = GlobalItems.items[currentItem]
		tempDict["Count"] = 1;
		GlobalItems.inventory[GlobalItems.inventory.size()] = tempDict

	print(GlobalItems.inventory)
			
	
