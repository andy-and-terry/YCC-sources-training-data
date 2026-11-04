fun main() {
    for (base in listOf(2, 8, 16, 36)) {
        println("255 in base $base = ${255.toString(base)}")
    }
    println("zz".toInt(36))
    println("9".toIntOrNull(8))  // null: invalid digit for base 8
}
