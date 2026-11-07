fun plusOne(digits: IntArray): IntArray {
    val d = digits.copyOf()
    for (i in d.indices.reversed()) {
        if (d[i] < 9) {
            d[i]++
            return d
        }
        d[i] = 0
    }
    return intArrayOf(1) + d
}

fun main() {
    println(plusOne(intArrayOf(1, 2, 9)).toList()) // [1, 3, 0]
    println(plusOne(intArrayOf(9, 9)).toList())    // [1, 0, 0]
}
