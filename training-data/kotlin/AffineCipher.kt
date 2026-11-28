fun modInverse(a: Int, m: Int) = (1 until m).first { a * it % m == 1 }

fun affine(s: String, a: Int, b: Int, decrypt: Boolean = false): String {
    val inv = modInverse(a, 26)
    return s.map { ch ->
        if (ch !in 'A'..'Z') ch else {
            val x = ch - 'A'
            val y = if (decrypt) Math.floorMod(inv * (x - b), 26) else (a * x + b) % 26
            'A' + y
        }
    }.joinToString("")
}

fun main() {
    val c = affine("AFFINE", 5, 8)
    println("$c ${affine(c, 5, 8, true)}")
}
