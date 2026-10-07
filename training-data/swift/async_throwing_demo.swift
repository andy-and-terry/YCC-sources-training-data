enum FetchError: Error {
    case notFound(id: Int)
}

func fetchRecord(id: Int) async throws -> String {
    guard id > 0 else { throw FetchError.notFound(id: id) }
    try? await Task.sleep(nanoseconds: 1_000_000)
    return "record-\(id)"
}

func fetchAll(ids: [Int]) async throws -> [String] {
    try await withThrowingTaskGroup(of: String.self) { group in
        for id in ids {
            group.addTask { try await fetchRecord(id: id) }
        }
        var results: [String] = []
        for try await value in group {
            results.append(value)
        }
        return results
    }
}

func run() async {
    do {
        let records = try await fetchAll(ids: [1, 2, 3])
        print(records)
    } catch {
        print("fetchAll failed: \(error)")
    }

    do {
        let bad = try await fetchAll(ids: [1, -2, 3])
        print(bad)
    } catch let error as FetchError {
        print("known failure: \(error)")
    } catch {
        print("unknown failure: \(error)")
    }
}

Task {
    await run()
}
