# Moser-de Bruijn sequence: binary digits of n read in base 4.
println(join([parse(Int, string(n, base = 2), base = 4) for n in 0:11], " "))
