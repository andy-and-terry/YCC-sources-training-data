fun main() {
    val limit = 80
    val composite = BooleanArray(limit + 1)
    var i = 2
    while (i * i <= limit) {
        if (!composite[i]) for (j in i * i..limit step i) composite[j] = true
        i++
    }
    val pairs = (3..limit - 2).filter { !composite[it] && !composite[it + 2] }
        .map { "($it,${it + 2})" }
    println(pairs.joinToString(" ")) // (3,5) (5,7) (11,13) (17,19) (29,31) (41,43) (59,61) (71,73)
}
