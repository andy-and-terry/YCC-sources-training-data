def area(List pts) {
    double s = 0
    pts.eachWithIndex { p, i ->
        def q = pts[(i + 1) % pts.size()]
        s += p[0] * q[1] - q[0] * p[1]
    }
    Math.abs(s) / 2
}

println area([[0, 0], [4, 0], [4, 3], [0, 3]])
