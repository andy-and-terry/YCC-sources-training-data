fun main() {
    val nums = listOf(3, 1, 4, 1, 5, 9)

    println(nums.fold(0) { acc, n -> acc + n })
    println(nums.reduce { a, b -> maxOf(a, b) })
    println(nums.runningFold(0) { acc, n -> acc + n })
    println(nums.runningReduce { a, b -> a * b })
    println(nums.foldRight("") { n, acc -> "$acc$n" })

    val summary = nums.fold(mutableMapOf<Boolean, Int>()) { m, n ->
        m.merge(n % 2 == 0, 1, Int::plus)
        m
    }
    println(summary)
}
