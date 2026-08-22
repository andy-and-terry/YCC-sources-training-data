let numbers = 1...1_000_000
let firstFiveEvenSquares = numbers.lazy
    .filter { $0 % 2 == 0 }
    .map { $0 * $0 }
    .prefix(5)

print(Array(firstFiveEvenSquares))
