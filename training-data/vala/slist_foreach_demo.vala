void main () {
    var list = new SList<string> ();
    list.append ("gamma");
    list.append ("alpha");
    list.append ("beta");
    list.prepend ("omega");

    list.sort (strcmp);
    list.foreach ((s) => stdout.printf ("%s\n", s));

    stdout.printf ("length: %u\n", list.length ());
    stdout.printf ("index of beta: %d\n", list.index ("beta"));
    list.remove ("omega");
    stdout.printf ("after remove: %u\n", list.length ());
}
