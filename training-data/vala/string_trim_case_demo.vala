void main () {
    string s = "   Hello, World!   ";
    stdout.printf ("[%s]\n", s.strip ());
    stdout.printf ("[%s]\n", s.chug ());
    stdout.printf ("[%s]\n", s.chomp ());
    stdout.printf ("%s\n", s.strip ().up ());
    stdout.printf ("%s\n", s.strip ().down ());
    stdout.printf ("starts: %s ends: %s\n",
                   s.strip ().has_prefix ("Hello").to_string (),
                   s.strip ().has_suffix ("?").to_string ());
    stdout.printf ("%s\n", s.strip ().replace ("o", "0"));
    stdout.printf ("%s\n", "ab".concat ("cd", "ef"));
    stdout.printf ("%s\n", string.joinv ("-", { "x", "y", "z" }));
    stdout.printf ("%s\n", "ha".replace ("a", "ah").reverse ());
}
