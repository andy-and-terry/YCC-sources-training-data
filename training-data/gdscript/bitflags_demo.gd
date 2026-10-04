extends Node

const FLAG_FIRE := 1 << 0
const FLAG_ICE := 1 << 1
const FLAG_POISON := 1 << 2
const FLAG_SHOCK := 1 << 3

var status := 0

func add_flag(flag: int) -> void:
	status |= flag

func remove_flag(flag: int) -> void:
	status &= ~flag

func toggle_flag(flag: int) -> void:
	status ^= flag

func has_flag(flag: int) -> bool:
	return (status & flag) != 0

func _ready():
	add_flag(FLAG_FIRE)
	add_flag(FLAG_POISON)
	print("binary: ", String.num_int64(status, 2))
	print(has_flag(FLAG_FIRE), " ", has_flag(FLAG_ICE))
	toggle_flag(FLAG_ICE)
	remove_flag(FLAG_FIRE)
	print("binary: ", String.num_int64(status, 2))

	var mask := FLAG_ICE | FLAG_SHOCK
	print("any of mask: ", (status & mask) != 0)
	print("all of mask: ", (status & mask) == mask)
	print("shifts: ", 1 << 4, " ", 256 >> 3)
