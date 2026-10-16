class Greeter(val greeting: String) {
    fun greet(name: String) = "$greeting, $name"
}

fun isEven(n: Int) = n % 2 == 0
fun twice(f: (Int) -> Int, x: Int) = f(f(x))

fun main() {
    println(listOf(1, 2, 3, 4).filter(::isEven))
    println(listOf("a", "bb").map(String::length))

    val g = Greeter("Hi")
    val bound = g::greet
    println(bound("Ann"))
    val unbound = Greeter::greet
    println(unbound(Greeter("Yo"), "Bob"))

    val ctor = ::Greeter
    println(ctor("Hey").greeting)
    println(twice(Int::inc, 5))
    println(listOf("x", "y").map(String::uppercase))
}
