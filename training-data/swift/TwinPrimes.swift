let n = 50
var composite = [Bool](repeating: false, count: n + 1)
var i = 2
while i * i <= n {
    if !composite[i] {
        for j in stride(from: i * i, through: n, by: i) { composite[j] = true }
    }
    i += 1
}
let twins = (3...(n - 2)).filter { !composite[$0] && !composite[$0 + 2] }.map { ($0, $0 + 2) }
print(twins)
