interface Notification {
    fun notify(message: String): String
}

class EmailNotification : Notification {
    override fun notify(message: String) = "Email: $message"
}

class SmsNotification : Notification {
    override fun notify(message: String) = "SMS: $message"
}

class PushNotification : Notification {
    override fun notify(message: String) = "Push: $message"
}

object NotificationFactory {
    fun create(kind: String): Notification = when (kind) {
        "email" -> EmailNotification()
        "sms" -> SmsNotification()
        "push" -> PushNotification()
        else -> throw IllegalArgumentException("unknown kind: $kind")
    }
}

fun main() {
    val kinds = listOf("email", "sms", "push")
    for (kind in kinds) {
        val notification = NotificationFactory.create(kind)
        println(notification.notify("build finished"))
    }
}
