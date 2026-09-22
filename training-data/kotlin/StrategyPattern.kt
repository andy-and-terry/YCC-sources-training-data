interface SortStrategy {
    fun sort(items: IntArray): IntArray
}

class AscendingStrategy : SortStrategy {
    override fun sort(items: IntArray): IntArray = items.sortedArray()
}

class DescendingStrategy : SortStrategy {
    override fun sort(items: IntArray): IntArray = items.sortedArrayDescending()
}

class Sorter(private var strategy: SortStrategy) {
    fun setStrategy(strategy: SortStrategy) {
        this.strategy = strategy
    }

    fun execute(items: IntArray): IntArray = strategy.sort(items)
}

fun main() {
    val data = intArrayOf(5, 2, 8, 1, 9)
    val sorter = Sorter(AscendingStrategy())
    println(sorter.execute(data).joinToString())

    sorter.setStrategy(DescendingStrategy())
    println(sorter.execute(data).joinToString())
}
