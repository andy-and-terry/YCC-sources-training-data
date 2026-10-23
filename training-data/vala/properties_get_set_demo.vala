class Temperature : Object {
    private double _celsius = 0;

    public double celsius {
        get { return _celsius; }
        set { _celsius = value < -273.15 ? -273.15 : value; }
    }

    public double fahrenheit {
        get { return _celsius * 9 / 5 + 32; }
    }
}

void main() {
    var t = new Temperature();
    t.celsius = 100;
    stdout.printf("%.1f C = %.1f F\n", t.celsius, t.fahrenheit);
    t.celsius = -500;
    stdout.printf("clamped: %.2f\n", t.celsius);
}
