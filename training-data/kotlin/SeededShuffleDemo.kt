import kotlin.random.Random

fun main() {
    val items = (1..8).toList()
    val first = items.shuffled(Random(42))
    val second = items.shuffled(Random(42))
    println(first == second)
    println(first.sorted() == items)
    println(items.random(Random(7)) in items)
}
