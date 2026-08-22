fun main() {
    val numbers = listOf(1, 2, 3, 4, 5)
    val doubled = numbers.map { it * 2 }
    val evens = numbers.filter { it % 2 == 0 }
    val sum = numbers.fold(0) { acc, n -> acc + n }

    println(doubled)
    println(evens)
    println(sum)

    fun compose(f: (Int) -> Int, g: (Int) -> Int): (Int) -> Int = { f(g(it)) }
    val addOneThenDouble = compose({ it * 2 }, { it + 1 })
    println(addOneThenDouble(3))
}
