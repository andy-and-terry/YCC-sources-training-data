import kotlin.properties.Delegates

class Settings {
    var volume: Int by Delegates.observable(50) { _, old, new ->
        println("volume changed from $old to $new")
    }
}

fun main() {
    val settings = Settings()
    settings.volume = 80
    settings.volume = 30
}
