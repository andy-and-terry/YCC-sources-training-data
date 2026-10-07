struct AsyncCountdown: AsyncSequence {
    typealias Element = Int

    let start: Int

    struct AsyncIterator: AsyncIteratorProtocol {
        var current: Int

        mutating func next() async -> Int? {
            guard current > 0 else { return nil }
            try? await Task.sleep(nanoseconds: 1_000_000)
            defer { current -= 1 }
            return current
        }
    }

    func makeAsyncIterator() -> AsyncIterator {
        AsyncIterator(current: start)
    }
}

func run() async {
    var collected: [Int] = []
    for await value in AsyncCountdown(start: 5) {
        collected.append(value)
    }
    print(collected)

    let doubled = await AsyncCountdown(start: 3).reduce(into: [Int]()) { partial, value in
        partial.append(value * 2)
    }
    print(doubled)
}

Task {
    await run()
}
