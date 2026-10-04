fun main() {
    println((1..5).toList())
    println((1 until 5).toList())
    println((10 downTo 1 step 3).toList())
    println(('a'..'e').joinToString(""))
    println(3 in 1..5)
    println((1..10).filter { it % 3 == 0 })
    println((1..20 step 5).sum())

    val r = 1..10
    println("${r.first} ${r.last} ${r.count()}")
    println((1..3).reversed().toList())
    println(5.coerceIn(0, 3))
    println(1.5 in 1.0..2.0)

    for (i in 0 until 3) print("$i ")
    println()
    for ((i, c) in "abc".withIndex()) print("$i$c ")
    println()
}
