let limit = 80
var composite = [Bool](repeating: false, count: limit + 1)
var i = 2
while i * i <= limit {
    if !composite[i] {
        for j in stride(from: i * i, through: limit, by: i) { composite[j] = true }
    }
    i += 1
}
let pairs = (3...(limit - 2)).filter { !composite[$0] && !composite[$0 + 2] }
    .map { "(\($0),\($0 + 2))" }
print(pairs.joined(separator: " ")) // (3,5) (5,7) (11,13) (17,19) (29,31) (41,43) (59,61) (71,73)
