fun main() {
    println((1..5).toList())
    println((1 until 5).toList())
    println((10 downTo 1 step 3).toList())
    println(('a'..'e').joinToString(""))
    println(5 in 1..10)
    println(3.5 in 1.0..3.0)

    val range = 1..20 step 5
    println("${range.first} ${range.last} ${range.step}")

    for (i in 0..<3) print("$i ")
    println()

    val ints = 1..10
    println(ints.filter { it % 2 == 0 }.sum())
    println(ints.reversed().take(3))

    val closed = 1.0..2.0
    println(closed.contains(1.5) to closed.isEmpty())
}
