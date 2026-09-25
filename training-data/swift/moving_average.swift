struct MovingAverage {
    private var buffer: [Double]
    private var index = 0
    private var count = 0
    private var sum = 0.0

    init(size: Int) { buffer = Array(repeating: 0, count: size) }

    mutating func next(_ v: Double) -> Double {
        sum += v - buffer[index]
        buffer[index] = v
        index = (index + 1) % buffer.count
        count = min(count + 1, buffer.count)
        return sum / Double(count)
    }
}

var ma = MovingAverage(size: 3)
print([1.0, 10, 3, 5, 8, 2].map { ma.next($0) })
