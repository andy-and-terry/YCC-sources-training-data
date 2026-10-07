enum Planet: Int, CaseIterable {
    case mercury = 1, venus, earth, mars

    var label: String {
        String(describing: self).capitalized
    }
}

enum Direction: String, CaseIterable {
    case north = "N", east = "E", south = "S", west = "W"

    func turnedRight() -> Direction {
        let all = Direction.allCases
        let i = all.firstIndex(of: self)!
        return all[(i + 1) % all.count]
    }
}

for p in Planet.allCases {
    print(p.rawValue, p.label)
}
print(Planet(rawValue: 3)?.label ?? "none")
print(Planet(rawValue: 9) == nil)
print(Direction.west.turnedRight().rawValue)
print(Direction(rawValue: "S") as Any)
