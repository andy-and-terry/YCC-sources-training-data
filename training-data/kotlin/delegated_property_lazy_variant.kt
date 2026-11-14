class Config {
    val data: Map<String, String> by lazy {
        println("loading")
        mapOf("a" to "1")
    }
}

fun main() {
    val c = Config()
    println(c.data["a"])
    println(c.data["a"])
}
