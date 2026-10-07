func fetchValue(_ id: Int) async -> Int {
    id * id
}

func sumOfSquares(upTo n: Int) async -> Int {
    await withTaskGroup(of: Int.self) { group in
        for i in 1...n {
            group.addTask { await fetchValue(i) }
        }
        var total = 0
        for await value in group {
            total += value
        }
        return total
    }
}

func firstDivisor(of n: Int, in candidates: [Int]) async -> Int? {
    await withTaskGroup(of: Int?.self) { group -> Int? in
        for c in candidates {
            group.addTask {
                n % c == 0 ? c : nil
            }
        }
        for await found in group {
            if let found {
                group.cancelAll()
                return found
            }
        }
        return nil
    }
}

Task {
    let total = await sumOfSquares(upTo: 5)
    print(total)

    let divisor = await firstDivisor(of: 84, in: [5, 7, 11, 13])
    print(divisor as Any)
}
