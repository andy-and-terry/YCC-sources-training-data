struct FetchError: Error {}

func fetchValue(id: Int) async throws -> Int {
    if id == 3 {
        throw FetchError()
    }
    return id * id
}

func sumOfSquares(ids: [Int]) async -> Int {
    await withTaskGroup(of: Int.self) { group in
        for id in ids where id != 3 {
            group.addTask {
                (try? await fetchValue(id: id)) ?? 0
            }
        }
        var total = 0
        for await value in group {
            total += value
        }
        return total
    }
}

Task {
    let result = await sumOfSquares(ids: [1, 2, 4, 5])
    print(result)
}
