fun connect(
    host: String,
    port: Int = 80,
    secure: Boolean = false,
    timeoutMs: Long = 1000,
): String {
    val scheme = if (secure) "https" else "http"
    return "$scheme://$host:$port (timeout=${timeoutMs}ms)"
}

fun main() {
    println(connect("example.com"))
    println(connect("example.com", 8080))
    println(connect("example.com", secure = true))
    println(connect(timeoutMs = 50, host = "local", port = 9000))
    println(connect("x", secure = true, port = 443))
}
