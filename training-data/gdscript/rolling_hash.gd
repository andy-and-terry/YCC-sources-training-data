extends SceneTree

func _init():
	var s := "abcabc"
	var k := 3
	var B := 31
	var M := 1000003
	for i in range(s.length() - k + 1):
		var h := 0
		for c in s.substr(i, k):
			h = (h * B + c.unicode_at(0)) % M
		print(i, " ", h)
	quit()
