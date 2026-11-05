class Temp : Object {
    private double _c;
    public double celsius {
        get { return _c; }
        set { _c = value < -273.15 ? -273.15 : value; }
    }
    public double fahrenheit { get { return _c * 9 / 5 + 32; } }
}

void main () {
    var t = new Temp ();
    t.celsius = 100;
    print ("%.1f\n", t.fahrenheit);
    t.celsius = -500;
    print ("%.2f\n", t.celsius);
}
