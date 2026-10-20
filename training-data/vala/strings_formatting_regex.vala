void main () {
    string s = "Hello, World";
    print ("%d %s %s %s\n", s.length, s.up (), s.down (), s.substring (7));
    print ("%s %d %s\n", s.replace ("l", "L"), s.index_of ("o"), s.reverse ());
    print ("%s|%s|%s\n", "  pad  ".strip (), "x".concat ("y", "z"), string.joinv ("-", {"a", "b", "c"}));
    foreach (var part in "a,b,,c".split (",")) print ("[%s]", part);
    print ("\n");
    print ("%5.2f|%-6s|%03d|%x|%c\n", 3.14159, "ab", 7, 255, 'z');
    print ("%s\n", @"interpolated $(s.length) and $(1 + 2)");
    print ("%s\n", """raw "verbatim" text""");
    print ("%d %d %s\n", int.parse ("42"), "ab".get_char (0), s.has_prefix ("Hell").to_string ());
    try {
        var re = new Regex ("(\\d+)-(\\d+)");
        MatchInfo mi;
        if (re.match ("tel 555-1234", 0, out mi)) print ("%s %s\n", mi.fetch (1), mi.fetch (2));
        print ("%s\n", re.replace ("a1-2b", -1, 0, "<\\1|\\2>"));
    } catch (RegexError e) { print ("regex error\n"); }
    var sb = new StringBuilder ();
    for (int i = 0; i < 3; i++) sb.append_printf ("%d,", i);
    print ("%s\n", sb.str);
}
