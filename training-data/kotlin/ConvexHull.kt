data class Pt(val x: Int, val y: Int)

fun cross(o: Pt, a: Pt, b: Pt): Long =
    (a.x - o.x).toLong() * (b.y - o.y) - (a.y - o.y).toLong() * (b.x - o.x)

fun halfHull(pts: List<Pt>): List<Pt> {
    val h = mutableListOf<Pt>()
    for (q in pts) {
        while (h.size >= 2 && cross(h[h.size - 2], h.last(), q) <= 0) h.removeAt(h.lastIndex)
        h.add(q)
    }
    h.removeAt(h.lastIndex)
    return h
}

// Andrew's monotone chain, counter-clockwise result
fun convexHull(points: List<Pt>): List<Pt> {
    val p = points.sortedWith(compareBy<Pt> { it.x }.thenBy { it.y })
    return halfHull(p) + halfHull(p.reversed())
}

fun main() {
    val pts = listOf(Pt(0, 0), Pt(2, 0), Pt(1, 1), Pt(2, 2), Pt(0, 2), Pt(1, 3))
    println(convexHull(pts))
}
