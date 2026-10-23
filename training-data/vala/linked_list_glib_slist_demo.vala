// GLib.List is a doubly linked list; SList is singly linked.
void main () {
    var list = new List<string> ();
    list.append ("beta");
    list.append ("gamma");
    list.prepend ("alpha");
    list.insert ("delta", 2);

    stdout.printf ("length: %u\n", list.length ());
    foreach (unowned string s in list) {
        stdout.printf ("%s ", s);
    }
    stdout.printf ("\n");

    stdout.printf ("first: %s, last: %s\n", list.first ().data, list.last ().data);
    stdout.printf ("index of gamma: %d\n", list.index ("gamma"));

    list.sort ((a, b) => strcmp (a, b));
    foreach (unowned string s in list) {
        stdout.printf ("%s ", s);
    }
    stdout.printf ("\n");

    list.reverse ();
    stdout.printf ("after reverse first: %s\n", list.first ().data);

    list.remove ("delta");
    stdout.printf ("after remove: %u\n", list.length ());
}
