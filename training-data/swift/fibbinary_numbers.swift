// Fibbinary numbers: no two adjacent 1 bits.
let fibbinary = (0..<50).filter { $0 & ($0 >> 1) == 0 }
print(fibbinary.map(String.init).joined(separator: " "))
