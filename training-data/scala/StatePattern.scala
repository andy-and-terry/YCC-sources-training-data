// GoF State pattern: behavior changes based on an internal state object,
// modeled here with a sealed trait so the compiler can check exhaustiveness
// of any `match` over the state hierarchy.
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

class TrafficLight {
  private var state: TrafficLightState = Red

  def current: String = state.name

  def advance(): Unit = {
    state = state.next
  }
}

object StatePatternDemo {
  def main(args: Array[String]): Unit = {
    val light = new TrafficLight()
    for (_ <- 1 to 5) {
      println(light.current)
      light.advance()
    }
  }
}
