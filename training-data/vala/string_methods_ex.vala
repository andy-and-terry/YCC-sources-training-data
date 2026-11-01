void main () {
    string s = "Hello, Vala";
    print ("%s %d\n", s.up (), s.length);
    print ("%s\n", s.substring (7, 4));
    print ("%d\n", s.index_of ("Vala"));
    foreach (var p in "a,b,c".split (",")) print ("[%s]", p);
    print ("\n%s\n", @"len=$(s.length)");
}
