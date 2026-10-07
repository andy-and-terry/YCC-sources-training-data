trait Image {
  def display(): String
}

class RealImage(filename: String) extends Image {
  println(s"loading $filename from disk (expensive)")

  def display(): String = s"displaying $filename"
}

class ImageProxy(filename: String) extends Image {
  private var realImage: Option[RealImage] = None

  def display(): String = {
    if (realImage.isEmpty) realImage = Some(new RealImage(filename))
    realImage.get.display()
  }
}

object ProxyPattern {
  def main(args: Array[String]): Unit = {
    val proxy = new ImageProxy("diagram.png")
    println("proxy created, image not loaded yet")
    println(proxy.display())
    println(proxy.display())
  }
}
