extends Node

var credits = 10000
#this should be all the items in the game 
#Bread, Apple, Soda, Pizza, and Ice Cream are all temp Items
#key is number, value is another dictionary entry item information
var items = {
	0: {
		"Name" : "Bread",
		"Description" : "This is bread.",
		"Cost" : 10,
		"icon" : preload("res://assets/sewer_bedroom/food/bread.png")
	},
	1: {
		"Name" : "Apple",
		"Description" : "This is an apple.",
		"Cost" : 50,
		"icon" : preload("res://assets/sewer_bedroom/food/apple.png")
	},
	2: {
		"Name" : "Soda",
		"Description" : "This is soda.",
		"Cost" : 100,
		"icon" : preload("res://assets/sewer_bedroom/food/soda.png")
	},
	3: {
		"Name" : "Pizza",
		"Description" : "This is pizza.",
		"Cost" : 500,
		"icon" : preload("res://assets/sewer_bedroom/food/pizza.png")
	},
	4: {
		"Name" : "Ice Cream",
		"Description" : "This is ice cream.",
		"Cost" : 1000,
		"icon" : preload("res://assets/sewer_bedroom/food/icecream.png")
	}
}

var inventory = {
}

# Path for the save file
const SAVE_PATH = "user://inventory_save.json"


# Save the inventory to a file
# Got a lot of help from ChatGPT for this since I failed at saving something before - Sandra
func save_inventory():
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE) #opens the file at the save path
	if file: #need to learn what this is for
		file.store_string(JSON.stringify(inventory)) #stores the inventory string
		file.close() # closes the file

# Load the inventory from a file
func load_inventory():
	var json = JSON.new()  # Create an instance of the JSON class
	if FileAccess.file_exists(SAVE_PATH):
		var file = FileAccess.open(SAVE_PATH, FileAccess.READ) # open the file
		if file: #need to learn what this is for
			var result = json.parse(file.get_as_text())  # Parse the JSON data
			if result == OK:
				inventory = json.result  # Retrieve the parsed result
			else:
				print("Error parsing JSON")
			file.close()
	else:
		inventory = {}  # Initialize empty if no save exists
	
	
