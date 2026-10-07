fun interface Validator {
    fun isValid(value: Int): Boolean
}

fun filterValues(values: List<Int>, validator: Validator): List<Int> =
    values.filter { validator.isValid(it) }

fun main() {
    val isEven = Validator { it % 2 == 0 }
    println(filterValues(listOf(1, 2, 3, 4, 5, 6), isEven))

    val isPositive: Validator = Validator { it > 0 }
    println(filterValues(listOf(-2, -1, 0, 1, 2), isPositive))

    println(filterValues(listOf(10, 15, 20, 25)) { it % 5 == 0 && it % 10 == 0 })
}
