string zigzag (string s, int rows) {
    if (rows == 1 || rows >= s.length) return s;
    var lines = new StringBuilder[rows];
    for (int i = 0; i < rows; i++) lines[i] = new StringBuilder ();
    int r = 0, step = 1;
    for (int i = 0; i < s.length; i++) {
        lines[r].append_c (s[i]);
        if (r == 0) step = 1;
        else if (r == rows - 1) step = -1;
        r += step;
    }
    var result = new StringBuilder ();
    foreach (var l in lines) result.append (l.str);
    return result.str;
}

void main () {
    print ("%s\n", zigzag ("PAYPALISHIRING", 3));
}
