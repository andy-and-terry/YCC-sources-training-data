void main () {
    string csv = "red, green ,blue,  yellow";
    string[] parts = csv.split (",");

    for (int i = 0; i < parts.length; i++) {
        parts[i] = parts[i].strip ();
    }
    print ("%s\n", string.joinv (" | ", parts));
    print ("count: %d\n", parts.length);

    string sentence = "the quick  brown fox";
    foreach (string w in sentence.split (" ")) {
        if (w != "") {
            print ("[%s]", w.up ());
        }
    }
    print ("\n");

    string[] limited = "a:b:c:d".split (":", 2);
    print ("%s / %s\n", limited[0], limited[1]);

    print ("%s\n", "hello world".replace ("o", "0"));
    print ("%s\n", "  padded  ".strip ());
    print ("%d\n", "banana".index_of ("nan"));
    print ("%s\n", "banana".substring (1, 3));
    print ("%s\n", "ab".concat ("cd", "ef"));
}
