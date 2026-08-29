public class Emitter : Object {
    public signal void data_received(string message);

    public void fire() {
        data_received("ping");
    }
}

void main() {
    var emitter = new Emitter();
    emitter.data_received.connect((msg) => {
        stdout.printf("Received: %s\n", msg);
    });
    emitter.fire();
}
