let numbers = [2, 4, 6, 7, 8, 10, 11]

print(numbers.prefix(3))
print(numbers.suffix(2))
print(numbers.prefix(while: { $0 % 2 == 0 }))
print(Array(numbers.drop(while: { $0 % 2 == 0 })))
print(numbers.dropFirst(5))
print(numbers.dropLast(5))
print(numbers.first(where: { $0 > 6 }) as Any)
print(numbers.lastIndex(where: { $0 % 2 == 0 }) as Any)
