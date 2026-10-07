class AudioSystem {
    fun play(track: String) = println("playing audio: $track")
}

class VideoSystem {
    fun loadVideo(name: String) = println("loading video: $name")
}

class SubtitleSystem {
    fun enable(lang: String) = println("subtitles enabled: $lang")
}

class MediaPlayerFacade {
    private val audio = AudioSystem()
    private val video = VideoSystem()
    private val subtitles = SubtitleSystem()

    fun playMovie(name: String, lang: String) {
        video.loadVideo(name)
        audio.play(name)
        subtitles.enable(lang)
    }
}

fun main() {
    val player = MediaPlayerFacade()
    player.playMovie("adventure.mp4", "en")
}
