var numbers = [5, 2, 8, 1, 9, 4, 7]

numbers.swapAt(0, 6)
print(numbers)

let pivot = numbers.partition(by: { $0 >= 5 })
print("pivot index: \(pivot)")
print("below: \(numbers[..<pivot].sorted())")
print("at or above: \(numbers[pivot...].sorted())")

numbers.reverse()
print(numbers.count)

var seeded = [10, 20, 30, 40]
seeded.removeAll(where: { $0 > 25 })
print(seeded)
