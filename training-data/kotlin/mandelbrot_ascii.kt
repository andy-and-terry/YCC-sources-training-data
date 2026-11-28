fun escape(cr: Double, ci: Double): Int {
    var zr = 0.0; var zi = 0.0
    for (n in 0 until 30) {
        if (zr * zr + zi * zi >= 4.0) return n
        val t = zr * zr - zi * zi + cr
        zi = 2 * zr * zi + ci
        zr = t
    }
    return 30
}

fun main() {
    for (yi in -5..5) {
        println((-40..12).joinToString("") { if (escape(it / 20.0, yi / 5.0) == 30) "#" else "." })
    }
}
