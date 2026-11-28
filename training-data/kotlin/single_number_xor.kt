fun main() {
    println(listOf(4, 1, 2, 1, 2).fold(0) { acc, n -> acc xor n }) // 4
}
