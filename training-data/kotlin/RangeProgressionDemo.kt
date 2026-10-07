fun main() {
    println((1..5).toList())
    println((1 until 5).toList())
    println((5 downTo 1).toList())
    println((0..20 step 5).toList())
    println((10 downTo 0 step 3).toList())
    println(('a'..'f').toList())
    println((1..10).reversed().step(4).toList())

    val r = 3..9
    println("${r.first} ${r.last} ${r.step} ${r.count()}")
    println(5 in r)
    println(10 !in r)
    println(r.sum())
    println(1..0 == IntRange.EMPTY)
    println((1..0).isEmpty())

    val score = 77
    val grade = when (score) {
        in 90..100 -> "A"
        in 80 until 90 -> "B"
        in 70 until 80 -> "C"
        else -> "F"
    }
    println(grade)

    println(1.5 in 1.0..2.0)
    val dr = 0.0..1.0
    println(dr.contains(0.5) to dr.endInclusive)
    println("kiwi" in "apple".."pear")
    println((1..3).flatMap { a -> (a..3).map { b -> a to b } })

    for (i in 1..3) for (j in i..3) print("$i$j ")
    println()
    val evens = generateSequence(0) { it + 2 }.takeWhile { it <= 10 }.toList()
    println(evens)
    println((1..4).zip('a'..'d'))
    println(IntProgression.fromClosedRange(1, 10, 3).toList())
}
