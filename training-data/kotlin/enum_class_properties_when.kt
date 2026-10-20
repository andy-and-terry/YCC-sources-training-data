enum class Planet(val mass: Double, val radius: Double) {
    EARTH(5.97e24, 6.37e6), MARS(6.42e23, 3.39e6);
    val gravity get() = 6.674e-11 * mass / (radius * radius)
}

enum class Op(val sym: Char) : (Int, Int) -> Int {
    ADD('+') { override fun invoke(a: Int, b: Int) = a + b },
    MUL('*') { override fun invoke(a: Int, b: Int) = a * b }
}

fun main() {
    Planet.values().forEach { println("${it.name} %.2f".format(it.gravity)) }
    println(Op.values().map { "${it.sym}=${it(3, 4)}" })
    println(Planet.valueOf("MARS").ordinal)
}
