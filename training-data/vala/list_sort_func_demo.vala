void main () {
    var list = new GLib.List<string> ();
    list.append ("pear");
    list.append ("fig");
    list.append ("banana");
    list.append ("kiwi");

    list.sort ((a, b) => {
        int by_len = a.length - b.length;
        return by_len != 0 ? by_len : strcmp (a, b);
    });
    foreach (var s in list) {
        stdout.printf ("%s ", s);
    }
    stdout.printf ("\n");
}
