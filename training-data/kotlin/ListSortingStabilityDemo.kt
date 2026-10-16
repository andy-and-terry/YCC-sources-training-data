data class Card(val rank: Int, val suit: Char)

fun main() {
    val cards = listOf(Card(3, 'H'), Card(1, 'S'), Card(3, 'C'), Card(2, 'D'), Card(1, 'H'))

    println(cards.sortedBy { it.rank })
    println(cards.sortedByDescending { it.rank })
    println(cards.sortedWith(compareBy<Card> { it.rank }.thenByDescending { it.suit }))
    println(cards.sortedWith(compareByDescending<Card> { it.rank }.thenBy { it.suit }))
    println(cards.maxByOrNull { it.rank })
    println(cards.minOf { it.rank })

    val mutable = cards.toMutableList()
    mutable.sortBy { it.suit }
    println(mutable.map { "${it.rank}${it.suit}" })
    mutable.shuffle(kotlin.random.Random(1))
    println(mutable.size)
}
