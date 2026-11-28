string affine (string s, int a, int b) {
    var sb = new StringBuilder ();
    for (int i = 0; i < s.length; i++) {
        char ch = s[i];
        if (ch >= 'A' && ch <= 'Z') {
            ch = (char) ('A' + (a * (ch - 'A') + b) % 26);
        }
        sb.append_c (ch);
    }
    return sb.str;
}

void main () {
    print ("%s\n", affine ("AFFINE", 5, 8));
}
