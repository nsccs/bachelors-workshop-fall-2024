extends Panel

var ItemName = ""
var ItemDescription = ""
var ItemCost = 0
var ItemCount = 0
var hasItem = false
var mouseEntered = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if hasItem == true:
		get_node("icon").show()
		get_node("item_name").text = ItemName
		get_node("item_count").text =  str(ItemCount)
		
	else:
		get_node("icon").hide()
		get_node("item_name").text = ""
		get_node("item_count").text = ""


func _on_mouse_entered() -> void:
	if hasItem:
		mouseEntered = true
		


func _on_mouse_exited() -> void:
	mouseEntered = false


func _input(event):
	if event.is_action_pressed("left_click"):
		if mouseEntered:
			$ItemInfo.visible = true
			get_node("../../ItemInfo/icon").texture =  get_node("icon").texture
			get_node("../../ItemInfo/").ItemName =  ItemName
			get_node("../../ItemInfo/").ItemDescription =  ItemDescription
			get_node("../../ItemInfo/").ItemCost =  ItemCost
			get_node("../../ItemInfo/").ItemCount =  ItemCount

func _on_slot_gui_input(event: InputEvent):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if hasItem:
			$ItemInfo.visible = true
			$ItemInfo.get_node("icon").texture = get_node("icon").textur
			$ItemInfo.get_node("item_name").text = ItemName
			$ItemInfo.get_node("item_description").text = ItemDescription
			$ItemInfo.get_node("item_cost").text = str(ItemCost)
			$ItemInfo.get_node("item_count").text = str(ItemCount)
	

		
			
