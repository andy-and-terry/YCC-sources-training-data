public class Alarm : Object {
    public signal void triggered(string reason) {
        stdout.printf("[default handler] alarm logged: %s\n", reason);
    }
}

void main() {
    var alarm = new Alarm();

    alarm.triggered.connect((reason) => {
        stdout.printf("[listener] handling: %s\n", reason);
    });

    alarm.triggered("smoke detected");
    alarm.triggered("door opened");
}
