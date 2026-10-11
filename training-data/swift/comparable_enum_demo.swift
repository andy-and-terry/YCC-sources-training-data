enum Priority: Int, Comparable {
    case low = 1, medium, high, critical

    static func < (lhs: Priority, rhs: Priority) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
}

let tasks: [(String, Priority)] = [
    ("write docs", .low),
    ("fix outage", .critical),
    ("review PR", .medium),
    ("ship release", .high)
]

for (name, p) in tasks.sorted(by: { $0.1 > $1.1 }) {
    print("\(p): \(name)")
}
print(Priority.high > Priority.medium)
print(tasks.map(\.1).max()!)
