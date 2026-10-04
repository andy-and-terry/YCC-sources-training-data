interface Clickable {
    fun onClick(x: Int, y: Int): String
}

fun register(listener: Clickable): String = listener.onClick(3, 4)

open class Greeter(val greeting: String) {
    open fun greet(name: String) = "$greeting, $name"
}

fun main() {
    val listener = object : Clickable {
        var clicks = 0
        override fun onClick(x: Int, y: Int): String {
            clicks++
            return "click #$clicks at ($x,$y)"
        }
    }
    println(register(listener))
    println(register(listener))

    val shouting = object : Greeter("HEY") {
        override fun greet(name: String) = super.greet(name).uppercase() + "!"
    }
    println(shouting.greet("ada"))

    val point = object {
        val x = 1
        val y = 2
        fun sum() = x + y
    }
    println("${point.x} ${point.y} ${point.sum()}")

    val comparator = object : Comparator<String> {
        override fun compare(a: String, b: String) = a.length - b.length
    }
    println(listOf("ccc", "a", "bb").sortedWith(comparator))

    var counter = 0
    val inc = object : Runnable {
        override fun run() { counter++ }
    }
    repeat(3) { inc.run() }
    println(counter)
}
