void main () {
    string s = "Hello, Vala";
    print ("%s %d %s\n", s.up (), s.length, s.substring (7));
    var sb = new StringBuilder ();
    for (int i = 0; i < 3; i++) sb.append_printf ("[%d]", i);
    print ("%s\n", sb.str);
}
