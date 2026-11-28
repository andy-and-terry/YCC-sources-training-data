func escape(_ cr: Double, _ ci: Double) -> Int {
    var zr = 0.0, zi = 0.0
    for n in 0..<30 {
        if zr * zr + zi * zi >= 4 { return n }
        (zr, zi) = (zr * zr - zi * zi + cr, 2 * zr * zi + ci)
    }
    return 30
}

for yi in -5...5 {
    print((-40...12).map { escape(Double($0) / 20, Double(yi) / 5) == 30 ? "#" : "." }.joined())
}
