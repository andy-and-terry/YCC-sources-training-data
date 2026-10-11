fun main() {
    val nums = listOf(1, 3, 5, 6, 7, 9, 2)

    println(nums.takeWhile { it % 2 == 1 })
    println(nums.dropWhile { it % 2 == 1 })
    println(nums.takeLastWhile { it < 8 })
    println(nums.dropLastWhile { it < 8 })
    println(nums.take(2) + nums.takeLast(2))
    println(nums.drop(5))

    val text = "   leading spaces"
    println(text.dropWhile { it == ' ' })
    println("12abc34".takeWhile { it.isDigit() })
    println(nums.indexOfFirst { it > 5 })
    println(nums.indexOfLast { it > 5 })
    println(nums.slice(1..3))
}
