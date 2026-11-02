class Config {
    val heavy: String by lazy { println("init"); "loaded" }
    var count: Int by kotlin.properties.Delegates.observable(0) { _, o, n -> println("$o -> $n") }
}

fun main() {
    val c = Config()
    println(c.heavy); println(c.heavy)
    c.count = 5
}
