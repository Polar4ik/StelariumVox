extends Node

enum Planets {
	None,
	Ei,
	Kelme,
	Keli,
	Ila,
	Sazema
}

var planet := Planets.None

var can_test := false

var ei_tasks_ends := false
var kelme_tasks_ends := false
var keli_tasks_ends := false
var ila_tasks_ends := false

var pioner_position := Vector2.ZERO
var is_move := false
