struct Point: Hashable {
    let x: Int
    let y: Int
}

func aStarSearch(grid: [[Int]], start: Point, goal: Point) -> [Point]? {
    func heuristic(_ a: Point, _ b: Point) -> Int {
        abs(a.x - b.x) + abs(a.y - b.y)
    }

    let rows = grid.count
    let cols = grid[0].count

    var openSet: Set<Point> = [start]
    var cameFrom: [Point: Point] = [:]
    var gScore: [Point: Int] = [start: 0]
    var fScore: [Point: Int] = [start: heuristic(start, goal)]

    func neighbors(of point: Point) -> [Point] {
        let candidates = [
            Point(x: point.x + 1, y: point.y),
            Point(x: point.x - 1, y: point.y),
            Point(x: point.x, y: point.y + 1),
            Point(x: point.x, y: point.y - 1),
        ]
        return candidates.filter {
            $0.x >= 0 && $0.x < rows && $0.y >= 0 && $0.y < cols && grid[$0.x][$0.y] == 0
        }
    }

    func reconstructPath(to point: Point) -> [Point] {
        var path = [point]
        var current = point
        while let previous = cameFrom[current] {
            path.append(previous)
            current = previous
        }
        return path.reversed()
    }

    while !openSet.isEmpty {
        let current = openSet.min { (fScore[$0] ?? Int.max) < (fScore[$1] ?? Int.max) }!
        if current == goal {
            return reconstructPath(to: current)
        }
        openSet.remove(current)

        for neighbor in neighbors(of: current) {
            let tentativeG = (gScore[current] ?? Int.max) + 1
            if tentativeG < (gScore[neighbor] ?? Int.max) {
                cameFrom[neighbor] = current
                gScore[neighbor] = tentativeG
                fScore[neighbor] = tentativeG + heuristic(neighbor, goal)
                openSet.insert(neighbor)
            }
        }
    }

    return nil
}

let grid = [
    [0, 0, 0, 0],
    [1, 1, 0, 1],
    [0, 0, 0, 0],
    [0, 1, 1, 0],
]

if let path = aStarSearch(grid: grid, start: Point(x: 0, y: 0), goal: Point(x: 3, y: 3)) {
    print(path.map { "(\($0.x),\($0.y))" }.joined(separator: " -> "))
} else {
    print("no path found")
}
