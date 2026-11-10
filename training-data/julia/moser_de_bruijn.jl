# Read the binary digits of i as base-4 digits.
moser_de_bruijn(i) = parse(Int, string(i, base = 2), base = 4)

println([moser_de_bruijn(i) for i in 0:9]) # [0, 1, 4, 5, 16, 17, 20, 21, 64, 65]
