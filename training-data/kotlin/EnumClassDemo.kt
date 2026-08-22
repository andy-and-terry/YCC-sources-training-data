enum class Suit(val symbol: String) {
    HEARTS("♥"), SPADES("♠"), CLUBS("♣"), DIAMONDS("♦");

    fun color(): String = when (this) {
        HEARTS, DIAMONDS -> "red"
        SPADES, CLUBS -> "black"
    }
}

fun main() {
    for (suit in Suit.values()) {
        println("${suit.name} (${suit.symbol}): ${suit.color()}")
    }
}
