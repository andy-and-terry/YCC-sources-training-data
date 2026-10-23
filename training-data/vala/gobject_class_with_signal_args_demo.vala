class Thermostat : Object {
    public signal void threshold_crossed (double temperature, bool rising);

    private double current = 20.0;
    public double limit { get; set; default = 25.0; }

    public void update (double t) {
        bool was_above = current > limit;
        current = t;
        bool is_above = current > limit;
        if (was_above != is_above) {
            threshold_crossed (current, is_above);
        }
    }
}

void main () {
    var t = new Thermostat ();
    t.threshold_crossed.connect ((temp, rising) => {
        print ("%.1f degrees, %s\n", temp, rising ? "rising" : "falling");
    });
    t.update (22.0);
    t.update (27.5);
    t.update (24.0);
}
