interface Observer {
    fun update(value: Int)
}

class Subject {
    private val observers = mutableListOf<Observer>()

    fun subscribe(observer: Observer) {
        observers.add(observer)
    }

    fun notifyAll(value: Int) {
        observers.forEach { it.update(value) }
    }
}

class ConcreteObserver(private val name: String) : Observer {
    override fun update(value: Int) {
        println("$name received $value")
    }
}

fun main() {
    val subject = Subject()
    subject.subscribe(ConcreteObserver("A"))
    subject.subscribe(ConcreteObserver("B"))
    subject.notifyAll(42)
}
