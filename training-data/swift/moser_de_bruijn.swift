// Moser-de Bruijn sequence: binary digits of n read in base 4.
let moser = (0..<12).map { Int(String($0, radix: 2), radix: 4)! }
print(moser.map(String.init).joined(separator: " "))
