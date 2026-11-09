void main () {
    string s = "Hello, Vala";
    print ("%d %s %s\n", s.length, s.up (), s.substring (0, 5));
    print ("%s\n", string.joinv ("-", s.split (", ")));
    print ("%d\n", s.index_of ("Vala"));
}
