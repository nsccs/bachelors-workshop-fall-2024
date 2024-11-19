extends VBoxContainer
@onready var item = preload("res://scenes/slot.tscn")
@onready var item_info = $ItemInfo  # Ensure this points to your `ItemInfo` box

var inventorySize = GlobalItems.getInventorySize()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#load slots
		for i in range(inventorySize):
			var itemTemp = item.instantiate();
			add_child(itemTemp)
			itemTemp.connect("gui_input", Callable(self, "_on_slot_gui_input"))

		
		fillInventorySlots()


func fillInventorySlots():
	for i in range(inventorySize):
		get_child(i).ItemName = ""
		get_child(i).ItemDescription = ""
		get_child(i).ItemCost = ""
		get_child(i).ItemCount = 0
		get_child(i).hasItem = true
		
	#fills in inventory into slots
	var keys = GlobalItems.inventory.keys()
	for i in GlobalItems.inventory:
		var item_data = GlobalItems.inventory[keys[i]]
		var slot = get_child(i)
		get_child(i).ItemName = item_data["Name"]
		get_child(i).ItemDescription = item_data["Description"]
		get_child(i).ItemCost = item_data["Cost"]
		get_child(i).ItemCount = item_data["Count"]
		get_child(i).get_node("icon").texture = item_data["icon"]
		get_child(i).hasItem = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
