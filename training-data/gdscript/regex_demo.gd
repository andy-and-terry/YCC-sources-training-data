extends Node

func _ready():
	var re := RegEx.new()
	re.compile("(?<key>\\w+)=(?<value>\\d+)")

	var text := "width=640 height=480 depth=32"
	for m in re.search_all(text):
		print(m.get_string("key"), " -> ", m.get_string("value"))

	var first := re.search(text)
	print(first.get_start(), " ", first.get_end(), " ", first.get_string(0))

	var digits := RegEx.create_from_string("\\d+")
	print(digits.sub("a1b22c333", "#", true))

	var email := RegEx.create_from_string("^[\\w.+-]+@[\\w-]+\\.[a-z]{2,}$")
	for s in ["me@example.com", "not-an-email"]:
		print(s, " valid: ", email.search(s) != null)
