class Button : Object {
    public signal void clicked (int count);
    private int n = 0;
    public void press () { clicked (++n); }
}

void main () {
    var b = new Button ();
    b.clicked.connect ((c) => print ("clicked %d times\n", c));
    b.press (); b.press ();
}
