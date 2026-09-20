interface Observer : Object {
    public abstract void on_update(int value);
}

class ConsoleObserver : Object, Observer {
    private string name;

    public ConsoleObserver(string name) {
        this.name = name;
    }

    public void on_update(int value) {
        stdout.printf("%s received update: %d\n", name, value);
    }
}

class Subject : Object {
    private Observer[] observers = {};

    public void attach(Observer observer) {
        observers += observer;
    }

    public void set_state(int value) {
        foreach (Observer observer in observers) {
            observer.on_update(value);
        }
    }
}

void main() {
    var subject = new Subject();
    subject.attach(new ConsoleObserver("A"));
    subject.attach(new ConsoleObserver("B"));
    subject.set_state(42);
}
