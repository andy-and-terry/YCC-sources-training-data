class Temperature : Object {
    private double _celsius;

    public double celsius {
        get { return _celsius; }
        set { _celsius = value; }
    }

    public double fahrenheit {
        get { return _celsius * 9.0 / 5.0 + 32.0; }
        set { _celsius = (value - 32.0) * 5.0 / 9.0; }
    }

    public Temperature(double celsius) {
        _celsius = celsius;
    }
}

void main() {
    var t = new Temperature(0.0);
    stdout.printf("%.1fC = %.1fF\n", t.celsius, t.fahrenheit);

    t.fahrenheit = 212.0;
    stdout.printf("%.1fC = %.1fF\n", t.celsius, t.fahrenheit);
}
