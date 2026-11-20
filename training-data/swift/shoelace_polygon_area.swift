// Shoelace polygon area with a struct.
struct Point { let x: Double; let y: Double }
func area(_ p: [Point]) -> Double {
    var s = 0.0
    for i in p.indices {
        let q = p[(i + 1) % p.count]
        s += p[i].x * q.y - q.x * p[i].y
    }
    return abs(s) / 2
}
print(area([Point(x: 0, y: 0), Point(x: 4, y: 0), Point(x: 4, y: 3), Point(x: 0, y: 3)]))
