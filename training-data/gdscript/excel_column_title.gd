func column_title(n: int) -> String:
	var title := ""
	while n > 0:
		n -= 1
		title = char(65 + n % 26) + title
		n /= 26
	return title

func _ready() -> void:
	print(column_title(28), " ", column_title(701))  # AB ZY
