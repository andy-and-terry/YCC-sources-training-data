interface SoundSource {
    fun play(): String
}

class BasicSoundSource : SoundSource {
    override fun play(): String = "playing basic sound"
}

class LoggingSoundSource(private val source: SoundSource) : SoundSource by source {
    fun playWithLog(): String {
        println("about to play")
        return play()
    }
}

fun main() {
    val logging = LoggingSoundSource(BasicSoundSource())
    println(logging.playWithLog())
    println(logging.play())
}
