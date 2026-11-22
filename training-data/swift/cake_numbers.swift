// Cake numbers: max pieces from n plane cuts of a cube, (n^3 + 5n + 6) / 6.
let cakes = (0..<10).map { n in (n * n * n + 5 * n + 6) / 6 }
print(cakes.map(String.init).joined(separator: " "))
