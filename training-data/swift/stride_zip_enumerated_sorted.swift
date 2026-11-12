let xs = [3, 1, 2]
for (i, x) in xs.enumerated() { print(i, x) }
for i in stride(from: 10, to: 0, by: -3) { print(i, terminator: " ") }
print()
print(zip(xs, ["a", "b", "c"]).map { "\($0)\($1)" }, xs.sorted(by: >))
