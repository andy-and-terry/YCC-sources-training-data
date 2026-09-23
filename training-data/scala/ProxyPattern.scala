trait Image {
  def display(): Unit
}

class RealImage(fileName: String) extends Image {
  loadFromDisk()

  private def loadFromDisk(): Unit = println(s"loading image from disk: $fileName")
  def display(): Unit = println(s"displaying $fileName")
}

class ProxyImage(fileName: String) extends Image {
  private var realImage: Option[RealImage] = None

  def display(): Unit = {
    if (realImage.isEmpty) realImage = Some(new RealImage(fileName))
    realImage.get.display()
  }
}

object ProxyPatternDemo {
  def main(args: Array[String]): Unit = {
    val image: Image = new ProxyImage("photo.png")
    println("proxy created, nothing loaded yet")
    image.display()
    image.display()
  }
}
