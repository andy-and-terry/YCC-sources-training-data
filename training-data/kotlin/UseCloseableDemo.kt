import java.io.Closeable

class Connection(private val name: String) : Closeable {
    init {
        println("opening connection: $name")
    }

    fun query(sql: String) = println("[$name] running: $sql")

    override fun close() = println("closing connection: $name")
}

fun main() {
    // Kotlin's `use` extension is the try-with-resources equivalent: it
    // closes the Closeable automatically, even if the block throws.
    Connection("primary").use { conn ->
        conn.query("SELECT * FROM users")
    }

    try {
        Connection("secondary").use { conn ->
            conn.query("SELECT * FROM orders")
            throw IllegalStateException("boom")
        }
    } catch (e: IllegalStateException) {
        println("caught: ${e.message}")
    }
}
