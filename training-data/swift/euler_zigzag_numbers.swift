// Euler zigzag numbers via the Seidel-Entringer boustrophedon.
var row = [1]
var out = [1]
for _ in 0..<9 {
    var next = [0]
    for x in row.reversed() { next.append(next.last! + x) }
    row = next
    out.append(row.last!)
}
print(out.map(String.init).joined(separator: " "))
