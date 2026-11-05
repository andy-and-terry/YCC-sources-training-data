class Conn private constructor(val url: String) {
    companion object {
        private var count = 0
        fun open(url: String): Conn { count++; return Conn(url) }
        fun opened() = count
    }
}

object Registry { val items = mutableListOf<String>() }

fun main() {
    Conn.open("a"); Conn.open("b")
    println(Conn.opened())
    Registry.items += "x"
    println(Registry.items)
}
