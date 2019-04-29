extends VBoxContainer

## Provided Signals
#signal value_changed(new_value)

## Exported vars
#export var value : int = 0 setget set_value, get_value

## Internal Vars
onready var remainingCp : Label = $VBoxContainer/HBoxContainer/RemainingCp

## Methods
func _ready():
	Global.connect("currentExpenses_changed", self, "_updateRemainingCp")
	Global.connect("currentIncome_changed", self, "_updateRemainingCp")

## Connected Signals
func _updateRemainingCp(val):
	remainingCp.text = "Current CP: "
	remainingCp.text += str(Global.remainingCp)
	if Global.remainingCp >= 0:
		remainingCp.add_color_override("font_color", Color(1,1,1))
	else:
		remainingCp.add_color_override("font_color", Color(1,0,0))