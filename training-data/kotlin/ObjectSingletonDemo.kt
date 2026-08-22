object Logger {
    private val messages = mutableListOf<String>()

    fun log(message: String) {
        messages.add(message)
    }

    fun history(): List<String> = messages
}

fun main() {
    Logger.log("started")
    Logger.log("processing")
    println(Logger.history())
}
