def area(List pts) {
    def s = pts.indices.sum { i ->
        def (x1, y1) = pts[i]
        def (x2, y2) = pts[(i + 1) % pts.size()]
        x1 * y2 - x2 * y1
    }
    Math.abs(s) / 2
}

println area([[0, 0], [4, 0], [4, 3], [0, 3]])
