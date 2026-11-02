class Button : Object {
    public signal void clicked (string label);
}

void main () {
    var b = new Button ();
    b.clicked.connect ((l) => print ("clicked %s\n", l));
    b.clicked ("OK");
}
