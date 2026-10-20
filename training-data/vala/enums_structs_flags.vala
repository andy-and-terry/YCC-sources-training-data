enum Color { RED, GREEN, BLUE;
    public string label () {
        switch (this) { case RED: return "red"; case GREEN: return "green"; default: return "blue"; }
    }
}

[Flags]
enum Perm { READ, WRITE, EXEC }

struct Point {
    public double x;
    public double y;
    public Point (double x, double y) { this.x = x; this.y = y; }
    public double dist () { return Math.sqrt (x * x + y * y); }
}

void main () {
    Color c = Color.GREEN;
    print ("%s %d\n", c.label (), (int) c);
    Perm p = Perm.READ | Perm.EXEC;
    print ("%s %s\n", (Perm.READ in p).to_string (), (Perm.WRITE in p).to_string ());
    var pt = Point (3, 4);
    var copy = pt;
    copy.x = 0;
    print ("%.1f %.1f\n", pt.dist (), copy.dist ());
    print ("%s\n", typeof (Color).name ());
}
