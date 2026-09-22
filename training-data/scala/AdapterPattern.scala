trait MediaPlayer {
  def play(fileName: String): Unit
}

class LegacyMp3Player {
  def playMp3(fileName: String): Unit = println(s"playing mp3: $fileName")
}

class Mp3PlayerAdapter(legacy: LegacyMp3Player) extends MediaPlayer {
  def play(fileName: String): Unit = legacy.playMp3(fileName)
}

class ModernPlayer extends MediaPlayer {
  def play(fileName: String): Unit = println(s"playing natively: $fileName")
}

object AdapterPatternDemo {
  def main(args: Array[String]): Unit = {
    val players: List[MediaPlayer] = List(new ModernPlayer, new Mp3PlayerAdapter(new LegacyMp3Player))
    players.foreach(_.play("song.mp3"))
  }
}
