extends StaticBody2D

export var triggers := []

var count := 0
var open := false

func _ready() -> void:
	for trigger in triggers:
		trigger.connect("value_changed", self, "_on_Trigger_value_changed")


func _on_Trigger_value_changed(value: bool) -> void:
	if value:
		count += 1
	else:
		count -= 1
	if count == len(triggers):
		open = true
		open()
	elif open:
		close()
		open = false


func open() -> void:
	pass


func close() -> void:
	pass
