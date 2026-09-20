trait Observer {
  def update(event: String): Unit
}

class EmailSubscriber(name: String) extends Observer {
  def update(event: String): Unit = println(s"$name received email: $event")
}

class Subject {
  private var observers: List[Observer] = List()

  def subscribe(o: Observer): Unit = observers = observers :+ o
  def unsubscribe(o: Observer): Unit = observers = observers.filterNot(_ == o)
  def notifyObservers(event: String): Unit = observers.foreach(_.update(event))
}

object ObserverPattern {
  def main(args: Array[String]): Unit = {
    val subject = new Subject
    val alice = new EmailSubscriber("Alice")
    val bob = new EmailSubscriber("Bob")

    subject.subscribe(alice)
    subject.subscribe(bob)
    subject.notifyObservers("new post published")

    subject.unsubscribe(bob)
    subject.notifyObservers("another update")
  }
}
