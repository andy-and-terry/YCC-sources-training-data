data class Config(var host: String = "", var port: Int = 0)

fun main() {
    val c = Config().apply { host = "localhost"; port = 8080 }
    println(c)
    val len = c.host.let { it.length }
    println(len)
    c.also { println("logging $it") }
    with(c) { println("$host:$port") }
    println(c.run { "$host/${port + 1}" })
}
