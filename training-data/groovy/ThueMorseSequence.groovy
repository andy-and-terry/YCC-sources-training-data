// Thue-Morse: t(n) is the parity of the number of 1 bits in n
println (0..<32).collect { Integer.bitCount(it) % 2 }.join('')
