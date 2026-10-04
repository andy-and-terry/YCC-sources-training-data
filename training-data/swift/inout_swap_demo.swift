func swapValues<T>(_ a: inout T, _ b: inout T) {
    let temp = a
    a = b
    b = temp
}

func normalize(_ values: inout [Double]) {
    guard let maxValue = values.max(), maxValue != 0 else { return }
    for i in values.indices {
        values[i] /= maxValue
    }
}

var x = 1, y = 2
swapValues(&x, &y)
print(x, y)

var s1 = "left", s2 = "right"
swapValues(&s1, &s2)
print(s1, s2)

var data = [2.0, 4.0, 8.0]
normalize(&data)
print(data)
