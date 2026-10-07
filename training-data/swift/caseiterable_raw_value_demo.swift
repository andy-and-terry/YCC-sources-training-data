enum Planet: Int, CaseIterable {
    case mercury = 1, venus, earth, mars

    var name: String { String(describing: self).capitalized }
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

print(Planet.allCases.count)
print(Planet.allCases.map(\.name))
print(Planet(rawValue: 3)?.name ?? "unknown")
print(Planet(rawValue: 9) as Any)
print(Planet.mars.rawValue)

print(Direction.allCases.map(\.rawValue).joined())
print(Direction(rawValue: "E")!.opposite)
print(Direction.allCases.filter { $0.rawValue > "M" })

for (index, d) in Direction.allCases.enumerated() {
    print(index, d, d.opposite.rawValue)
}

enum Suit: CaseIterable { case hearts, spades }
enum Rank: Int, CaseIterable { case two = 2, three, four }
let deck = Suit.allCases.flatMap { suit in Rank.allCases.map { (suit, $0) } }
print(deck.count, deck.first!)
print(Planet.allCases.last!, Planet.allCases.firstIndex(of: .earth)!)
print(Planet.allCases.reduce(0) { $0 + $1.rawValue })
