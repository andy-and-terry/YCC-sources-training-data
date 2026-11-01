struct Point {
    public int x;
    public int y;
    public double dist () { return Math.sqrt (x * x + y * y); }
}

void main () {
    Point p = { 3, 4 };
    print ("%.1f\n", p.dist ());
}
