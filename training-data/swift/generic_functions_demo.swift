func findMax<T: Comparable>(_ items: [T]) -> T? {
    items.max()
}

func swapValues<T>(_ a: inout T, _ b: inout T) {
    let temp = a
    a = b
    b = temp
}

print(findMax([3, 1, 4, 1, 5, 9]) ?? -1)
print(findMax(["banana", "apple", "cherry"]) ?? "")

var x = 1, y = 2
swapValues(&x, &y)
print(x, y)
