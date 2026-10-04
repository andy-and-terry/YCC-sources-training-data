data class Order(val id: Int, val customer: String, val total: Double)

fun main() {
    val orders = listOf(
        Order(1, "ann", 25.0),
        Order(2, "bob", 80.5),
        Order(3, "ann", 40.0),
        Order(4, "cy", 15.25),
        Order(5, "bob", 5.0)
    )

    println(orders.filter { it.total > 20 }.map { it.id })
    println(orders.groupBy { it.customer }.mapValues { (_, list) -> list.sumOf { it.total } })
    println(orders.partition { it.total >= 30 }.let { (big, small) -> big.size to small.size })
    println(orders.associateBy { it.id }[3]?.customer)
    println(orders.maxByOrNull { it.total }?.id)
    println(orders.sortedWith(compareBy({ it.customer }, { -it.total })).map { it.id })
    println(orders.map { it.customer }.distinct())
    println(orders.fold(0.0) { acc, o -> acc + o.total })
    println(orders.chunked(2).map { chunk -> chunk.map { it.id } })
    println(orders.windowed(3, step = 2).size)
    println(orders.zipWithNext { a, b -> b.total - a.total })
    println(orders.any { it.total < 10 } to orders.all { it.total < 100 })
    println(orders.take(2).flatMap { listOf(it.id, it.id * 10) })
}
