// Moser-de Bruijn sequence: binary digits of n read in base 4.
println((0..<12).collect { Integer.parseInt(Integer.toBinaryString(it), 4) }.join(' '))
