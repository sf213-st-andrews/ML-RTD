class_name KnightStateMachine
extends Node

var states : Array[State]

@export var current_state : State

func _ready():
	for child in get_children():
		if(child is State):
			states.append(child)
			
			# Set the states up with what they need to function
		else:
			push_warning("Child " + child.name + " is not a State for KnightStateMachine")
