infix fun Int.pow(e: Int): Long = Math.pow(this.toDouble(), e.toDouble()).toLong()

fun main() = println(2 pow 10)
