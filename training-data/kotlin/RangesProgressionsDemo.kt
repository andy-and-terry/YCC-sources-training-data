fun main() {
    println((1..5).toList())
    println((1 until 5).toList())
    println((10 downTo 1 step 3).toList())
    println(('a'..'e').toList())
    println(5 in 1..10)
    println(11 !in 1..10)

    val r = 1..20 step 5
    println("${r.first} ${r.last} ${r.step}")
    println((1..10).reversed().take(3))
    println((1..4).sumOf { it * it })
    println((0.0..1.0).contains(0.5))

    for (i in 3 downTo 1) print("$i ")
    println()

    for ((idx, c) in "abc".withIndex()) print("$idx$c ")
    println()

    val ageRange = 18..65
    val ages = listOf(10, 18, 40, 70)
    println(ages.map { if (it in ageRange) "adult" else "other" })
    println(ageRange.count())
    println((1..3).flatMap { a -> (1..2).map { b -> a * b } })
    println(1..0 == IntRange.EMPTY)
}
