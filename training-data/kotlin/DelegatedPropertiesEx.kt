import kotlin.properties.Delegates

class Settings {
    val expensive: String by lazy { println("computing"); "value" }
    var level: Int by Delegates.observable(0) { _, old, new -> println("level $old -> $new") }
}

fun main() {
    val s = Settings()
    println(s.expensive)
    println(s.expensive)
    s.level = 3
}
