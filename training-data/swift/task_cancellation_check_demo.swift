import Foundation

// Cooperative cancellation: the task must check for it itself.
func countSlowly(limit: Int) async throws -> Int {
    var total = 0
    for i in 1...limit {
        try Task.checkCancellation()
        total += i
        try await Task.sleep(nanoseconds: 10_000_000)
    }
    return total
}

func pollingLoop() async -> Int {
    var ticks = 0
    while !Task.isCancelled {
        ticks += 1
        await Task.yield()
    }
    return ticks
}

@main
struct Demo {
    static func main() async {
        let task = Task { try await countSlowly(limit: 1000) }
        try? await Task.sleep(nanoseconds: 50_000_000)
        task.cancel()
        do {
            _ = try await task.value
        } catch is CancellationError {
            print("counting task was cancelled")
        } catch {
            print("other error: \(error)")
        }

        let poller = Task { await pollingLoop() }
        poller.cancel()
        let ticks = await poller.value
        print("poller stopped, ticks > 0 or 0: \(ticks >= 0)")
    }
}
