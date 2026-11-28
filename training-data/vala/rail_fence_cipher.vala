string encode (string text, int rails) {
    var rows = new StringBuilder[rails];
    for (int i = 0; i < rails; i++) rows[i] = new StringBuilder ();
    int r = 0, step = 1;
    for (int i = 0; i < text.length; i++) {
        rows[r].append_c (text[i]);
        if (r == 0) step = 1;
        else if (r == rails - 1) step = -1;
        r += step;
    }
    var result = new StringBuilder ();
    foreach (var row in rows) result.append (row.str);
    return result.str;
}

void main () {
    print ("%s\n", encode ("WEAREDISCOVERED", 3));
}
