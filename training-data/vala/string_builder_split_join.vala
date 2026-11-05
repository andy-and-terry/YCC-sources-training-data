void main () {
    var sb = new StringBuilder ();
    foreach (var w in "one two three".split (" ")) {
        sb.append (w.up ()).append_c ('-');
    }
    print ("%s\n", sb.str);
    print ("%s\n", string.joinv (",", {"a", "b", "c"}));
}
