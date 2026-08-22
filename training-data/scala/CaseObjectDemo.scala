sealed trait TrafficLight
case object Red extends TrafficLight
case object Green extends TrafficLight
case object Yellow extends TrafficLight

object CaseObjectDemo {
  def next(light: TrafficLight): TrafficLight = light match {
    case Red => Green
    case Green => Yellow
    case Yellow => Red
  }

  def main(args: Array[String]): Unit = {
    var light: TrafficLight = Red
    for (_ <- 1 to 4) {
      println(light)
      light = next(light)
    }
  }
}
