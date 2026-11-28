class Counter : Object {
    public int count { get; private set; default = 0; }
    public signal void changed (int v);

    public void inc () { count++; changed (count); }
}

void main () {
    var c = new Counter ();
    c.changed.connect ((v) => print ("now %d\n", v));
    c.inc ();
    c.inc ();
}
