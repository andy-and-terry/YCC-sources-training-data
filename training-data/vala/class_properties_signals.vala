class Counter : Object {
    public int n { get; set; default = 0; }
    public signal void changed (int v);
    public void inc () { n++; changed (n); }
}
void main () {
    var c = new Counter ();
    c.changed.connect ((v) => print ("n=%d\n", v));
    c.inc (); c.inc ();
}
