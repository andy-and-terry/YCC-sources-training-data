func countingStream(upTo limit: Int) -> AsyncStream<Int> {
    AsyncStream { continuation in
        var current = 1
        while current <= limit {
            continuation.yield(current)
            current += 1
        }
        continuation.finish()
    }
}

func consume() async {
    var collected: [Int] = []
    for await value in countingStream(upTo: 5) {
        collected.append(value)
    }
    print(collected)
}

func filteredSum() async -> Int {
    var total = 0
    for await value in countingStream(upTo: 10) where value % 2 == 0 {
        total += value
    }
    return total
}

Task {
    await consume()
    let total = await filteredSum()
    print(total)
}
