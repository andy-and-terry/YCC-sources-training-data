delegate void Handler(string message);

class EventBus : Object {
    Handler[] handlers = {};

    public void subscribe(Handler handler) {
        handlers += handler;
    }

    public void publish(string message) {
        foreach (Handler h in handlers) {
            h(message);
        }
    }
}

void log_handler(string message) {
    stdout.printf("[log] %s\n", message);
}

void main() {
    var bus = new EventBus();
    bus.subscribe(log_handler);

    int count = 0;
    bus.subscribe((message) => {
        count++;
        stdout.printf("[counter #%d] %s\n", count, message);
    });

    bus.publish("service started");
    bus.publish("service stopped");
}
