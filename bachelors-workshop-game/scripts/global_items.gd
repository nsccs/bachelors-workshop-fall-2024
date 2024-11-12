extends Node

var gold = 10000
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
