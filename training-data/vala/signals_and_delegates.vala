class Button : Object {
    public signal void clicked (int n);
}

void main () {
    var b = new Button ();
    b.clicked.connect ((n) => print ("clicked %d\n", n));
    b.clicked (3);
}
