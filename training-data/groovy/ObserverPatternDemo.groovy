interface Observer {
    void onChanged(int value)
}

class Subject {
    List<Observer> observers = []
    int value = 0

    void subscribe(Observer o) {
        observers << o
    }

    void setValue(int v) {
        value = v
        observers.each { it.onChanged(v) }
    }
}

def subject = new Subject()
subject.subscribe({ v -> println "logger saw: $v" } as Observer)
subject.subscribe({ v -> println "doubled: ${v * 2}" } as Observer)
subject.setValue(10)
subject.setValue(21)
