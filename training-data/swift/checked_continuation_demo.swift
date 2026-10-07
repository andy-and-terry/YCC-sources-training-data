import Foundation

func legacyFetch(id: Int, completion: @escaping (Result<String, Error>) -> Void) {
    DispatchQueue.global().asyncAfter(deadline: .now() + 0.01) {
        if id < 0 {
            completion(.failure(NSError(domain: "demo", code: 1)))
        } else {
            completion(.success("item-\(id)"))
        }
    }
}

func fetch(id: Int) async throws -> String {
    try await withCheckedThrowingContinuation { continuation in
        legacyFetch(id: id) { result in
            continuation.resume(with: result)
        }
    }
}


@main
struct Main {
    static func main() async {
        if let v = try? await fetch(id: 7) { print(v) }
        do {
            _ = try await fetch(id: -1)
        } catch {
            print("failed:", error)
        }
    }
}
