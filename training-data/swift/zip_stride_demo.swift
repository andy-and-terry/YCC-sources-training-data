let names = ["Ann", "Bob", "Cy"]
let scores = [90, 72, 85]

for (name, score) in zip(names, scores) {
    print("\(name): \(score)")
}

for i in stride(from: 0, to: 10, by: 3) {
    print(i, terminator: " ")
}
print()

for i in stride(from: 10, through: 0, by: -5) {
    print(i, terminator: " ")
}
print()

for (index, name) in names.enumerated().reversed() {
    print(index, name)
}

let pairs = Array(zip(names, scores))
print(pairs)
