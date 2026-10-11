fun risky(n: Int): Int {
    try {
        println("try $n")
        if (n == 0) throw IllegalArgumentException("zero")
        return 10 / n
    } catch (e: IllegalArgumentException) {
        println("catch ${e.message}")
        return -1
    } finally {
        println("finally $n")
    }
}

class Resource(val name: String) : AutoCloseable {
    override fun close() = println("close $name")
}

fun main() {
    println(risky(5))
    println(risky(0))

    Resource("a").use { a ->
        Resource("b").use { b ->
            println("using ${a.name} and ${b.name}")
        }
    }

    val r = runCatching { error("boom") }
    println(r.exceptionOrNull()?.message)
    println(r.getOrDefault(0))
}
