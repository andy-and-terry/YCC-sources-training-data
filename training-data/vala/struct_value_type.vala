struct Pt { public int x; public int y;
    public int sum () { return x + y; } }
void main () { Pt p = { 3, 4 }; print ("%d\n", p.sum ()); }
