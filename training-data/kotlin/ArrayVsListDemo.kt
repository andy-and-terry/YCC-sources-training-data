fun main() {
    val arr = arrayOf(3, 1, 2)
    val ints = intArrayOf(3, 1, 2)
    val list = listOf(3, 1, 2)

    arr[0] = 10
    ints.sort()
    println(arr.toList())
    println(ints.joinToString())
    println(list.javaClass.simpleName.isNotEmpty())

    println(arr.contentEquals(arrayOf(10, 1, 2)))
    println(arr == arrayOf(10, 1, 2))
    println(list == listOf(3, 1, 2))

    val grid = Array(3) { r -> IntArray(3) { c -> r * 3 + c } }
    println(grid.joinToString("\n") { it.joinToString(" ") })
    println(grid.sumOf { it.sum() })

    val copy = ints.copyOf(5)
    println(copy.toList())
    println(ints.copyOfRange(1, 3).toList())
}
