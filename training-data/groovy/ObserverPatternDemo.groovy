interface Observer {
    void update(String event)
}

class Logger implements Observer {
    void update(String event) {
        println "Logger received: ${event}"
    }
}

class Subject {
    List<Observer> observers = []

    void subscribe(Observer o) {
        observers << o
    }

    void publish(String event) {
        observers.each { it.update(event) }
    }
}

def subject = new Subject()
subject.subscribe(new Logger())
subject.publish("started")
