extends Node

func is_leap_year(year: int) -> bool:
	return (year % 4 == 0 and year % 100 != 0) or year % 400 == 0

func _ready():
	print(is_leap_year(2000))
	print(is_leap_year(1900))
	print(is_leap_year(2024))
