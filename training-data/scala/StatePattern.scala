sealed trait TrafficLightState {
  def next: TrafficLightState
  def name: String
}

case object Red extends TrafficLightState {
  def next: TrafficLightState = Green
  def name: String = "Red"
}

case object Green extends TrafficLightState {
  def next: TrafficLightState = Yellow
  def name: String = "Green"
}

case object Yellow extends TrafficLightState {
  def next: TrafficLightState = Red
  def name: String = "Yellow"
}

class TrafficLight(private var state: TrafficLightState) {
  def current: String = state.name
  def advance(): Unit = { state = state.next }
}

object StatePatternDemo {
  def main(args: Array[String]): Unit = {
    val light = new TrafficLight(Red)
    for (_ <- 1 to 5) {
      println(light.current)
      light.advance()
    }
  }
}
