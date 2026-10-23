def cross = { o, a, b -> (a[0] - o[0]) * (b[1] - o[1]) - (a[1] - o[1]) * (b[0] - o[0]) }

// Andrew's monotone chain, counter-clockwise result
def build = { List pts ->
    def h = []
    pts.each { q ->
        while (h.size() >= 2 && cross(h[-2], h[-1], q) <= 0) h.pop()
        h << q
    }
    h.pop()
    h
}

def convexHull = { List pts ->
    def p = pts.sort(false) { a, b -> a[0] <=> b[0] ?: a[1] <=> b[1] }
    build(p) + build(p.reverse())
}

println convexHull([[0, 0], [2, 0], [1, 1], [2, 2], [0, 2], [1, 3]])
