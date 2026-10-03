case class Shape(kind: String, attrs: Map[String, Any]) {
  def clone(overrides: Map[String, Any]): Shape = copy(attrs = attrs ++ overrides)
}

class ShapeRegistry {
  private var prototypes: Map[String, Shape] = Map.empty

  def register(key: String, prototype: Shape): Unit = prototypes += (key -> prototype)

  def create(key: String, overrides: Map[String, Any] = Map.empty): Shape =
    prototypes(key).clone(overrides)
}

object PrototypePattern {
  def main(args: Array[String]): Unit = {
    val registry = new ShapeRegistry
    registry.register("circle", Shape("circle", Map("radius" -> 1, "color" -> "black")))

    val a = registry.create("circle")
    val b = registry.create("circle", Map("radius" -> 5, "color" -> "red"))
    println(a)
    println(b)
  }
}
