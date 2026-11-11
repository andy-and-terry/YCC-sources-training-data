// Square of the sum minus sum of squares for 1..10 (expect 2640)
let xs = Array(1...10)
let sum = xs.reduce(0, +)
let squares = xs.reduce(0) { $0 + $1 * $1 }
print(sum * sum - squares)
