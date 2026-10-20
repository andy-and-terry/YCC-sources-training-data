import kotlin.properties.Delegates

interface Greeter { fun greet(): String }
class English : Greeter { override fun greet() = "hello" }
class Polite(g: Greeter) : Greeter by g

class Holder {
    val heavy: String by lazy { println("computing"); "value" }
    var level: Int by Delegates.observable(0) { _, old, new -> println("level $old -> $new") }
    var positive: Int by Delegates.vetoable(1) { _, _, new -> new > 0 }
}

fun main() {
    println(Polite(English()).greet())
    val h = Holder()
    println(h.heavy + h.heavy)
    h.level = 5
    h.positive = -3
    println(h.positive)
}
