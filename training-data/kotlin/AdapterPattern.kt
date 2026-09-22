// Legacy interface the client code already depends on.
interface MediaPlayer {
    fun play(fileName: String)
}

// Incompatible third-party API we want to reuse without changing it.
class AdvancedAudioPlayer {
    fun playFlacFile(fileName: String) {
        println("playing flac file: $fileName")
    }
}

// Adapter makes AdvancedAudioPlayer usable wherever a MediaPlayer is expected.
class FlacPlayerAdapter(private val advancedPlayer: AdvancedAudioPlayer) : MediaPlayer {
    override fun play(fileName: String) {
        advancedPlayer.playFlacFile(fileName)
    }
}

class Mp3Player : MediaPlayer {
    override fun play(fileName: String) {
        println("playing mp3 file: $fileName")
    }
}

fun main() {
    val players: List<MediaPlayer> = listOf(
        Mp3Player(),
        FlacPlayerAdapter(AdvancedAudioPlayer())
    )
    players.forEach { it.play("track.audio") }
}
