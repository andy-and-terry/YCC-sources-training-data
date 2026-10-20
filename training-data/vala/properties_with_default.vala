class Temp {
    private double _c = 0;
    public double celsius { get { return _c; } set { _c = value; } }
    public double fahrenheit { get { return _c * 9 / 5 + 32; } }
}

void main () {
    var t = new Temp ();
    t.celsius = 100;
    print ("%.0f\n", t.fahrenheit);
}
