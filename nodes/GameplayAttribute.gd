tool
extends Node
class_name GameplayAttribute


export(float) var max_value = 0.0 setget set_max_value, get_max_value
export(float) var current_value = 0.0  setget set_current_value, get_current_value


signal attribute_changed


func get_current_value() -> float:
	return current_value


func get_max_value() -> float:
	return max_value


func set_current_value(value: float) -> void:
	current_value = clamp(value, 0, max_value)
	emit_signal("attribute_changed", self)


func set_max_value(value: float) -> void:
	if value >= 0:
		max_value = value
		emit_signal("attribute_changed", self)


func _get_configuration_warning():
	if get_parent().has_signal("attribute_changed"):
		return ""

	return "GameplayAttribute must be a direct child of a GameplayAttributeMap node."
