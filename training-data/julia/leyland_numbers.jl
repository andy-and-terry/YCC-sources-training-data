# Leyland numbers: x^y + y^x for x >= y >= 2.
leyland(x, y) = x^y + y^x

vals = [leyland(x, y) for x in 2:4 for y in 2:x]
println(join(vals, " "))
