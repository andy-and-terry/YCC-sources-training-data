fun findPair(grid: List<List<Int>>, target: Int): Pair<Int, Int>? {
    outer@ for ((i, row) in grid.withIndex()) {
        for ((j, v) in row.withIndex()) {
            if (v < 0) continue@outer
            if (v == target) return i to j
        }
    }
    return null
}

fun printUntilTen() {
    listOf(3, 7, 10, 12).forEach {
        if (it == 10) return@forEach
        println("item $it")
    }
    println("forEach finished")
}

fun firstBig(nums: List<Int>): Int? {
    nums.forEach {
        if (it > 5) return it
    }
    return null
}

fun main() {
    println(findPair(listOf(listOf(1, -1, 5), listOf(2, 5)), 5))
    printUntilTen()
    println(firstBig(listOf(1, 9, 3)))

    val sum = run loop@{
        var s = 0
        for (i in 1..10) {
            if (i > 4) return@loop s
            s += i
        }
        s
    }
    println(sum)

    val doubled = listOf(1, 2, 3).map lambda@{ return@lambda it * 2 }
    println(doubled)
}
