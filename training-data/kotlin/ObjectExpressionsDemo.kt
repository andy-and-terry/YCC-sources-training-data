interface Greeter {
    fun greet(name: String): String
}

abstract class Counter(var count: Int) {
    abstract fun step(): Int
}

fun main() {
    val polite = object : Greeter {
        override fun greet(name: String) = "Good day, $name."
    }
    println(polite.greet("Ann"))

    val point = object {
        val x = 3
        val y = 4
        fun dist() = Math.sqrt((x * x + y * y).toDouble())
    }
    println("${point.x},${point.y} -> ${point.dist()}")

    val byTwo = object : Counter(10) {
        override fun step(): Int {
            count += 2
            return count
        }
    }
    println(byTwo.step())
    println(byTwo.step())

    var clicks = 0
    val listener = object : Runnable {
        override fun run() { clicks++ }
    }
    repeat(3) { listener.run() }
    println(clicks)

    val cmp = object : Comparator<String> {
        override fun compare(a: String, b: String) = a.length - b.length
    }
    println(listOf("ccc", "a", "bb").sortedWith(cmp))
}
