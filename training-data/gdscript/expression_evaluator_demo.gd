extends Node

# The Expression class parses and evaluates a string at runtime,
# optionally binding named variables and a base object.

class Calculator:
	func double(x):
		return x * 2

func evaluate(text: String, names: PackedStringArray = [], values: Array = [], base: Object = null):
	var expr := Expression.new()
	var err := expr.parse(text, names)
	if err != OK:
		return "parse error: " + expr.get_error_text()
	var result = expr.execute(values, base)
	if expr.has_execute_failed():
		return "execute error: " + expr.get_error_text()
	return result

func _ready():
	print(evaluate("1 + 2 * 3"))
	print(evaluate("sqrt(16) + pow(2, 3)"))
	print(evaluate("x * y + 1", ["x", "y"], [6, 7]))
	print(evaluate("Vector2(3, 4).length()"))
	print(evaluate("double(21)", [], [], Calculator.new()))
	print(evaluate("\"abc\".to_upper()"))
	print(evaluate("1 +"))
