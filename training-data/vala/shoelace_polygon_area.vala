// Shoelace polygon area with a struct.
struct Point { public double x; public double y; }

void main () {
    Point[] p = { { 0, 0 }, { 4, 0 }, { 4, 3 }, { 0, 3 } };
    double s = 0;
    for (int i = 0; i < p.length; i++) {
        var q = p[(i + 1) % p.length];
        s += p[i].x * q.y - q.x * p[i].y;
    }
    print ("%.1f\n", Math.fabs (s) / 2);
}
