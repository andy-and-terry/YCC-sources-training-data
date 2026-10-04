enum Direction: String, CaseIterable {
    case north, east, south, west

    var opposite: Direction {
        switch self {
        case .north: return .south
        case .south: return .north
        case .east: return .west
        case .west: return .east
        }
    }
}

print(Direction.allCases.count)
for d in Direction.allCases {
    print("\(d.rawValue) <-> \(d.opposite.rawValue)")
}

if let d = Direction(rawValue: "south") {
    print("parsed \(d)")
}
print(Direction(rawValue: "up") == nil)
