class Config { var host = ""; var port = 0 }

fun main() {
    val c = Config().apply { host = "localhost"; port = 8080 }
    println("${c.host}:${c.port}")
    val len = "hello".let { it.length }
    val s = c.also { println("built") }.run { "$host/$port" }
    println("$len $s")
    with(c) { println(port + 1) }
}
