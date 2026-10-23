void main () {
    string s = "   Hello, Vala World!   ";

    print ("[%s]\n", s.strip ());
    print ("[%s]\n", s.chug ());
    print ("[%s]\n", s.chomp ());

    string t = s.strip ();
    print ("%s\n", t.up ());
    print ("%s\n", t.down ());
    print ("%d\n", t.length);
    print ("%s\n", t.reverse ());
    print ("%s\n", t.replace ("Vala", "Vala!"));
    print ("%d\n", t.index_of ("World"));
    print ("%s\n", t.substring (7, 4));
    print ("%s\n", t.has_prefix ("Hello").to_string ());
}
