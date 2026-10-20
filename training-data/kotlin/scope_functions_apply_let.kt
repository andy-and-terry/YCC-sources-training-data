data class Config(var host: String = "", var port: Int = 0)

fun main() {
    val cfg = Config().apply {
        host = "localhost"
        port = 8080
    }
    val label = cfg.takeIf { it.port > 0 }?.let { "${it.host}:${it.port}" } ?: "invalid"
    println(label)
}
