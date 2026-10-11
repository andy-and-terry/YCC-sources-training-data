fun main() {
    outer@ for (i in 1..4) {
        for (j in 1..4) {
            if (j == 3) continue@outer
            if (i == 3) break@outer
            print("($i,$j) ")
        }
    }
    println()

    var n = 0
    while (true) {
        n++
        if (n % 2 == 0) continue
        if (n > 7) break
        print("$n ")
    }
    println()

    do {
        n--
    } while (n > 5)
    println(n)

    for (i in 10 downTo 1 step 3) print("$i ")
    println()
    for (i in 0 until 3) print("$i ")
    println()
    repeat(2) { println("repeat $it") }
}
