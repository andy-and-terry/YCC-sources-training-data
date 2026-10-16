fun minRooms(meetings: List<Pair<Int, Int>>): Int {
    val starts = meetings.map { it.first }.sorted()
    val ends = meetings.map { it.second }.sorted()
    var rooms = 0
    var best = 0
    var e = 0
    for (s in starts) {
        if (s < ends[e]) rooms++ else e++
        best = maxOf(best, rooms)
    }
    return best
}

fun main() {
    println(minRooms(listOf(0 to 30, 5 to 10, 15 to 20)))
    println(minRooms(listOf(7 to 10, 2 to 4)))
    println(minRooms(listOf(1 to 5, 2 to 6, 3 to 7, 8 to 9)))
}
