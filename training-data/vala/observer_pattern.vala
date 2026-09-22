interface Observer : Object {
    public abstract void on_changed(int value);
}

class ConsoleObserver : Object, Observer {
    public string name;

    public ConsoleObserver(string name) {
        this.name = name;
    }

    public void on_changed(int value) {
        stdout.printf("%s notified: %d\n", name, value);
    }
}

class Subject : Object {
    Observer[] observers = {};
    int state = 0;

    public void attach(Observer o) {
        observers += o;
    }

    public void set_state(int value) {
        state = value;
        foreach (Observer o in observers) {
            o.on_changed(state);
        }
    }
}

void main() {
    var subject = new Subject();
    subject.attach(new ConsoleObserver("A"));
    subject.attach(new ConsoleObserver("B"));

    subject.set_state(5);
    subject.set_state(10);
}
