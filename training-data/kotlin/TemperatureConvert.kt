enum class Unit(val toC: (Double) -> Double, val fromC: (Double) -> Double) {
    CELSIUS({ it }, { it }),
    FAHRENHEIT({ (it - 32) * 5 / 9 }, { it * 9 / 5 + 32 }),
    KELVIN({ it - 273.15 }, { it + 273.15 });
}

fun convert(v: Double, from: Unit, to: Unit): Double = to.fromC(from.toC(v))

fun main() {
    println("%.2f".format(convert(100.0, Unit.CELSIUS, Unit.FAHRENHEIT)))
    println("%.2f".format(convert(212.0, Unit.FAHRENHEIT, Unit.KELVIN)))
}
