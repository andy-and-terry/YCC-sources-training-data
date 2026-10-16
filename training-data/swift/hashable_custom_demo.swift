struct Point: Hashable {
    let x: Int
    let y: Int
}

struct CaseInsensitiveKey: Hashable {
    let text: String

    static func == (a: Self, b: Self) -> Bool {
        a.text.lowercased() == b.text.lowercased()
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(text.lowercased())
    }
}

var visited: Set<Point> = [Point(x: 0, y: 0)]
visited.insert(Point(x: 1, y: 2))
visited.insert(Point(x: 0, y: 0))
print(visited.count)

var scores: [CaseInsensitiveKey: Int] = [:]
scores[CaseInsensitiveKey(text: "Alice")] = 1
scores[CaseInsensitiveKey(text: "ALICE")] = 2
print(scores.count, scores[CaseInsensitiveKey(text: "alice")]!)
