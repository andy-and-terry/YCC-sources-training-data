func swapValues<T>(_ a: inout T, _ b: inout T) {
    let temp = a
    a = b
    b = temp
}

func increment(_ value: inout Int, by amount: Int = 1) {
    value += amount
}

func normalize(_ values: inout [Double]) {
    guard let maxValue = values.max(), maxValue != 0 else { return }
    for i in values.indices {
        values[i] /= maxValue
    }
}

func appendGreeting(to text: inout String) {
    text += ", hello"
}

var x = 1, y = 2
swapValues(&x, &y)
print(x, y)

var count = 10
increment(&count)
increment(&count, by: 5)
print(count)

var data = [2.0, 4.0, 8.0]
normalize(&data)
print(data)

var message = "Ann"
appendGreeting(to: &message)
print(message)

var names = ["a", "b", "c"]
swapValues(&names[0], &names[2])
print(names)

struct Stats { var total = 0 }
var stats = Stats()
increment(&stats.total, by: 7)
print(stats.total)

func tally(_ words: [String], into counts: inout [String: Int]) {
    for word in words { counts[word, default: 0] += 1 }
}
var counts: [String: Int] = [:]
tally(["x", "y", "x"], into: &counts)
tally(["x"], into: &counts)
print(counts["x"]!, counts["y"]!)
