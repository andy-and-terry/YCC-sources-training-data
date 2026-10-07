let names = ["a", "b", "c"]
let values = [10, 20, 30, 40]

for (name, value) in zip(names, values) {
    print(name, value)
}

for (i, name) in names.enumerated() {
    print(i, name)
}

for i in stride(from: 10, to: 0, by: -3) {
    print(i, terminator: " ")
}
print()

for x in stride(from: 0.0, through: 1.0, by: 0.25) {
    print(x, terminator: " ")
}
print()

let dict = Dictionary(uniqueKeysWithValues: zip(names, values))
print(dict.sorted { $0.key < $1.key })
