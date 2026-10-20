class Config { var host = ""; var port = 0 }

fun main() {
    val c = Config().apply { host = "localhost"; port = 8080 }
    val desc = c.run { "$host:$port" }
    val len = desc.let { it.length }
    val also = desc.also { println("log: $it") }
    with(c) { println(host.uppercase()) }
    val n: String? = null
    println(n?.let { it.length } ?: -1)
    println("$len ${also.length}")
}
