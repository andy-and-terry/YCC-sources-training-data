class Service {
    lateinit var config: String

    val isConfigured: Boolean
        get() = ::config.isInitialized

    fun init(value: String) {
        config = value
    }

    fun describe(): String = if (isConfigured) "config=$config" else "not configured"
}

class Holder {
    var value: Int by kotlin.properties.Delegates.notNull()
}

fun main() {
    val s = Service()
    println(s.describe())
    try {
        println(s.config)
    } catch (e: UninitializedPropertyAccessException) {
        println("caught: ${e.message}")
    }
    s.init("prod")
    println(s.describe())

    val h = Holder()
    try {
        println(h.value)
    } catch (e: IllegalStateException) {
        println("notNull not set")
    }
    h.value = 7
    println(h.value)
}
