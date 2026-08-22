class Pizza private constructor(val size: String, val toppings: List<String>) {
    class Builder {
        private var size = "medium"
        private val toppings = mutableListOf<String>()

        fun size(size: String) = apply { this.size = size }
        fun addTopping(topping: String) = apply { toppings.add(topping) }
        fun build() = Pizza(size, toppings)
    }
}

fun main() {
    val pizza = Pizza.Builder()
        .size("large")
        .addTopping("cheese")
        .addTopping("pepperoni")
        .build()
    println("${pizza.size}: ${pizza.toppings}")
}
