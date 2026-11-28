fun reverseByte(v: Int): Int = Integer.reverse(v) ushr 24

fun main() {
    for (v in listOf(1, 6, 13, 128)) {
        println("$v -> ${reverseByte(v)}") // 128, 96, 176, 1
    }
}
