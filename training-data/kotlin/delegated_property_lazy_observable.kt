import kotlin.properties.Delegates
class Cfg {
    val heavy: String by lazy { println("computing"); "value" }
    var level: Int by Delegates.observable(0) { _, old, new -> println("$old -> $new") }
}
fun main() {
    val c = Cfg()
    println(c.heavy); println(c.heavy)
    c.level = 3; c.level = 5
}
