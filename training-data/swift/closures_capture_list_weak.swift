class Box { var n = 0; deinit { print("freed") } }
var b: Box? = Box()
let f = { [weak b] in b?.n ?? -1 }
print(f())
b = nil
print(f())
