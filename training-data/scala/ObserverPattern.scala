trait Observer {
  def update(temperature: Double): Unit
}

class WeatherStation {
  private var observers: List[Observer] = List()
  private var temperature: Double = 0.0

  def subscribe(o: Observer): Unit = observers = observers :+ o
  def unsubscribe(o: Observer): Unit = observers = observers.filterNot(_ == o)

  def setTemperature(t: Double): Unit = {
    temperature = t
    observers.foreach(_.update(temperature))
  }
}

class Display(name: String) extends Observer {
  def update(temperature: Double): Unit = println(s"$name display: ${temperature}C")
}

object ObserverPatternDemo {
  def main(args: Array[String]): Unit = {
    val station = new WeatherStation
    val lobby = new Display("Lobby")
    val office = new Display("Office")

    station.subscribe(lobby)
    station.subscribe(office)
    station.setTemperature(21.5)

    station.unsubscribe(lobby)
    station.setTemperature(24.0)
  }
}
