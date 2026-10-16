let numbers = Array(1...20)

for n in numbers where n % 3 == 0 {
    print("multiple of three: \(n)")
}

let words = ["apple", "kiwi", "banana", "fig"]
for case let w in words where w.count > 4 {
    print("long word: \(w)")
}

let optionals: [Int?] = [1, nil, 3, nil, 5]
for case let value? in optionals {
    print("value \(value)")
}
