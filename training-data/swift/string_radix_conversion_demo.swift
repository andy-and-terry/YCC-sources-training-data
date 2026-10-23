let n = 255

print(String(n, radix: 2))
print(String(n, radix: 8))
print(String(n, radix: 16, uppercase: true))
print(String(n, radix: 36))

print(Int("ff", radix: 16) ?? -1)
print(Int("1010", radix: 2) ?? -1)
print(Int("zz", radix: 36) ?? -1)
print(Int("12", radix: 2) ?? -1)

let padded = String(repeating: "0", count: 8 - String(5, radix: 2).count) + String(5, radix: 2)
print(padded)
