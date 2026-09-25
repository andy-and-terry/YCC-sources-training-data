public class Sensor : Object {
    public int reading { get; set; }
}

public class Gauge : Object {
    public int level { get; set; }
}

void main() {
    var sensor = new Sensor();
    var gauge = new Gauge();

    sensor.bind_property("reading", gauge, "level", BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL);

    stdout.printf("gauge level: %d\n", gauge.level);

    sensor.reading = 42;
    stdout.printf("gauge level: %d\n", gauge.level);

    gauge.level = 7;
    stdout.printf("sensor reading: %d\n", sensor.reading);
}
