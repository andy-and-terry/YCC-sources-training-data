import scala.collection.mutable

case class TreeType(name: String, texture: String) {
  def render(x: Int, y: Int): String = s"$name ($texture) at ($x, $y)"
}

object TreeFactory {
  private val cache = mutable.Map[(String, String), TreeType]()

  def get(name: String, texture: String): TreeType =
    cache.getOrElseUpdate((name, texture), TreeType(name, texture))

  def cacheSize: Int = cache.size
}

object FlyweightPattern {
  def main(args: Array[String]): Unit = {
    val placements = List(("oak", "green", 1, 2), ("oak", "green", 5, 9), ("pine", "dark", 3, 3))

    for ((kind, texture, x, y) <- placements) {
      val treeType = TreeFactory.get(kind, texture)
      println(treeType.render(x, y))
    }
    println(s"distinct flyweights cached: ${TreeFactory.cacheSize}")
  }
}
