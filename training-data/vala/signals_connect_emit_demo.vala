class Button : Object {
    public signal void clicked (int times);
}

void main () {
    var b = new Button ();
    b.clicked.connect ((t) => print ("clicked %d\n", t));
    b.clicked (1);
    b.clicked (2);
}
