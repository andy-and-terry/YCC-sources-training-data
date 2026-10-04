fun main() {
    println((1..5).toList())
    println((1 until 5).toList())
    println((5 downTo 1).toList())
    println((0..20 step 5).toList())
    println((10 downTo 0 step 3).toList())
    println(('a'..'e').toList())

    val r = 10..20
    println(15 in r)
    println(25 !in r)
    println("${r.first} ${r.last} ${r.count()} ${r.sum()}")
    println(r.step)

    println((1..10).reversed().filter { it % 3 == 0 })
    println((1..0).isEmpty())

    val range = 1.0..2.0
    println(1.5 in range)
    println(range.start to range.endInclusive)

    for (i in 1..3) for (j in i..3) print("($i,$j) ")
    println()

    println((1..4).map { it * it })
    println((1..5).reduce { a, b -> a * b })
    println(1..3 == 1..3)
    val open = 1..<5
    println(open.last)
    println("abc".indices.toList())
    repeat(2) { println("repeat $it") }
}
