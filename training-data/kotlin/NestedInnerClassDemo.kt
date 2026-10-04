class Outer(private val label: String) {
    private var counter = 0

    // Nested class: no reference to the outer instance
    class Helper {
        fun shout(s: String) = s.uppercase() + "!"
    }

    // Inner class: holds a reference to the outer instance
    inner class Ticket {
        val number = ++counter
        fun describe() = "$label ticket #$number"
    }

    fun anonymousListener(): Runnable = object : Runnable {
        override fun run() {
            counter += 10
            println("$label counter now $counter")
        }
    }
}

fun main() {
    println(Outer.Helper().shout("hi"))

    val outer = Outer("Concert")
    val t1 = outer.Ticket()
    val t2 = outer.Ticket()
    println(t1.describe())
    println(t2.describe())

    outer.anonymousListener().run()
    println(outer.Ticket().describe())

    val local = object {
        val x = 3
        val y = 4
        fun dist() = Math.sqrt((x * x + y * y).toDouble())
    }
    println(local.dist())

    class LocalCounter {
        var n = 0
        fun inc() = ++n
    }
    val lc = LocalCounter()
    lc.inc(); lc.inc()
    println(lc.n)
}
