// Thue-Morse: t(n) is the parity of the number of 1 bits in n
let out = (0..<32).map { String($0.nonzeroBitCount % 2) }.joined()
print(out)
