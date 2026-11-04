for base in [2, 8, 16, 36] {
    print("255 in base \(base) = \(String(255, radix: base))")
}
print(Int("zz", radix: 36) ?? -1)
print(Int("9", radix: 8) as Any)  // nil
