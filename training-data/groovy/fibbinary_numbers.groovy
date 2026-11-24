// Fibbinary numbers: no two adjacent 1 bits.
println((0..<50).findAll { (it & (it >> 1)) == 0 }.join(' '))
