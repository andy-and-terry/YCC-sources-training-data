struct Point { public int x; public int y; }

void main () {
    Point p = { 3, 4 };
    Point q = p;
    q.x = 10;
    print ("%d %d\n", p.x, q.x);
}
