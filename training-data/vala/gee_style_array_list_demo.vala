void main () {
    var list = new GLib.Array<int> ();
    for (int i = 1; i <= 5; i++) {
        list.append_val (i * i);
    }
    list.prepend_val (0);
    list.insert_val (3, 99);
    list.remove_index (1);

    stdout.printf ("length: %u\n", list.length);
    for (uint i = 0; i < list.length; i++) {
        stdout.printf ("%d ", list.index (i));
    }
    stdout.printf ("\n");
}
