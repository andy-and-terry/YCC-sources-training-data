class Cfg { var host = ""; var port = 0 }

fun main() {
    val c = Cfg().apply { host = "localhost"; port = 80 }
    c.let { println("${it.host}:${it.port}") }
    val len = "hello".run { length }
    println(len)
}
