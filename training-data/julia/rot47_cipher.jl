rot47(s) = map(c -> 33 <= Int(c) <= 126 ? Char(33 + (Int(c) - 33 + 47) % 94) : c, s)

e = rot47("Hello, World!")
println(e, " ", rot47(e))
