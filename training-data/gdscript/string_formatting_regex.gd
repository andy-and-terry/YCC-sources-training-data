extends Node

func _ready() -> void:
	var s := "Hello, World"
	print(s.length(), " ", s.to_upper(), " ", s.to_lower(), " ", s.substr(7), " ", s.find("World"), " ", s.replace("l", "L"))
	print(s.split(", "), " ", "  pad  ".strip_edges(), "|", "ab".repeat(3), " ", s.begins_with("Hell"), s.ends_with("ld"), s.contains("lo, "))
	print("%05.1f|%-6s|%3d|%x|%s" % [3.14159, "ab", 7, 255, [1, 2]])
	print("{0} has {1} items".format([ "cart", 3 ]), " ", "{name}!".format({"name": "Ada"}))
	print("42".to_int() + 1, " ", "2.5".to_float() * 2, " ", "abc".is_valid_int(), " ", str(3.5), " ", String.num(1.0 / 3.0, 3))
	print(s.capitalize(), " ", "snake_case_word".to_pascal_case(), " ", "CamelCase".to_snake_case(), " ", "a,b;c".split(",", false))
	var re := RegEx.new()
	re.compile("(\\d+)-(\\d+)")
	var m := re.search("tel 555-1234")
	print(m.get_string(0), " ", m.get_string(1), " ", m.get_string(2))
	print(re.sub("1-2 and 3-4", "$2-$1", true))
	print(s.unicode_at(0), " ", char(72), " ", s.to_utf8_buffer().size(), " ", s.hash() != 0, " ", s.md5_text().length())
	print("a\tb".c_escape(), " ", "x".lpad(4, "."), " ", "x".rpad(4, "."), " ", "%d%%" % 50)
