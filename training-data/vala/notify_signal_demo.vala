public class Thermostat : Object {
    public double temperature { get; set; }

    public Thermostat(double initial) {
        temperature = initial;
    }
}

void main() {
    var t = new Thermostat(20.0);

    t.notify["temperature"].connect((s, p) => {
        stdout.printf("temperature changed to %.1f\n", t.temperature);
    });

    t.temperature = 22.5;
    t.temperature = 18.0;
    t.temperature = 18.0;
}
