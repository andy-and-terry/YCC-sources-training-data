class AudioSystem {
    void play(String track) { println "playing audio: $track" }
}

class VideoSystem {
    void loadVideo(String name) { println "loading video: $name" }
}

class SubtitleSystem {
    void enable(String lang) { println "subtitles enabled: $lang" }
}

class MediaPlayerFacade {
    def audio = new AudioSystem()
    def video = new VideoSystem()
    def subtitles = new SubtitleSystem()

    void playMovie(String name, String lang) {
        video.loadVideo(name)
        audio.play(name)
        subtitles.enable(lang)
    }
}

def player = new MediaPlayerFacade()
player.playMovie("adventure.mp4", "en")
