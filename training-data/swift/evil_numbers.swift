// Evil numbers have an even number of 1 bits.
let out = (0...20).filter { $0.nonzeroBitCount % 2 == 0 }
print(out.map(String.init).joined(separator: " "))
