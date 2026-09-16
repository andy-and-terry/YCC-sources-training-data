interface Coffee {
    fun cost(): Double
    fun description(): String
}

class SimpleCoffee : Coffee {
    override fun cost(): Double = 2.0
    override fun description(): String = "Coffee"
}

abstract class CoffeeDecorator(protected val wrapped: Coffee) : Coffee {
    override fun cost(): Double = wrapped.cost()
    override fun description(): String = wrapped.description()
}

class MilkDecorator(coffee: Coffee) : CoffeeDecorator(coffee) {
    override fun cost(): Double = wrapped.cost() + 0.5
    override fun description(): String = "${wrapped.description()} + Milk"
}

class SugarDecorator(coffee: Coffee) : CoffeeDecorator(coffee) {
    override fun cost(): Double = wrapped.cost() + 0.25
    override fun description(): String = "${wrapped.description()} + Sugar"
}

fun main() {
    var coffee: Coffee = SimpleCoffee()
    coffee = MilkDecorator(coffee)
    coffee = SugarDecorator(coffee)
    println("${coffee.description()}: ${coffee.cost()}")
}
