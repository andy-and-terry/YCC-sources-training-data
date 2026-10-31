fun isSelfDescribing(n: Long): Boolean {
    val s = n.toString()
    return s.indices.all { i -> s.count { it == '0' + i } == s[i] - '0' }
}

fun main() {
    listOf(1210L, 2020L, 21200L, 1211L).forEach { println("$it ${isSelfDescribing(it)}") }
}
