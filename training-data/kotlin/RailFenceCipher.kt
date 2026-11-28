fun order(n: Int, k: Int): List<Int> {
    val cycle = 2 * (k - 1)
    return (0 until n).sortedBy { i -> val r = i % cycle; if (r < k) r else cycle - r }
}

fun encrypt(t: String, k: Int) = order(t.length, k).map { t[it] }.joinToString("")

fun decrypt(c: String, k: Int): String {
    val out = CharArray(c.length)
    order(c.length, k).forEachIndexed { pos, i -> out[i] = c[pos] }
    return String(out)
}

fun main() {
    val c = encrypt("WEAREDISCOVERED", 3)
    println("$c ${decrypt(c, 3)}")
}
