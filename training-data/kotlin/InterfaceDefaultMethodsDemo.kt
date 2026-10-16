interface Logger {
    val prefix: String get() = "LOG"
    fun log(msg: String) = println("[$prefix] $msg")
}

interface Auditor {
    fun log(msg: String) = println("[AUDIT] $msg")
}

class Service : Logger, Auditor {
    override val prefix = "SVC"
    override fun log(msg: String) {
        super<Logger>.log(msg)
        super<Auditor>.log(msg)
    }
}

class Plain : Logger

fun main() {
    Service().log("started")
    Plain().log("plain")
}
