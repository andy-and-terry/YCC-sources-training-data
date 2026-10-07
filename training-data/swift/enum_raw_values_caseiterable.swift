enum Planet: Int, CaseIterable {
    case mercury = 1, venus, earth, mars

    var label: String {
        String(describing: self).capitalized
    }
}

enum Direction: String, CaseIterable {
    case north = "N", south = "S", east = "E", west = "W"

    var opposite: Direction {
        switch self {
        case .north: return .south
        case .south: return .north
        case .east: return .west
        case .west: return .east
        }
    }
}

for p in Planet.allCases {
    print(p.rawValue, p.label)
}
print(Planet(rawValue: 3)?.label ?? "none")
print(Planet(rawValue: 9) == nil)
print(Direction.allCases.map(\.rawValue).joined())
print(Direction(rawValue: "E")!.opposite)
