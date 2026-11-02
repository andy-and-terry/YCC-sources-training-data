void main () {
    string[] parts = "a,b,c".split (",");
    print ("%s\n", string.joinv ("-", parts));
    print (@"count=$(parts.length)\n");
}
