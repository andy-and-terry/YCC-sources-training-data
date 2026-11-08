string rot47 (string s) {
    var sb = new StringBuilder ();
    for (int i = 0; i < s.length; i++) {
        int n = (int) s[i];
        if (n >= 33 && n <= 126) n = 33 + (n - 33 + 47) % 94;
        sb.append_c ((char) n);
    }
    return sb.str;
}

void main () {
    var e = rot47 ("Hello, World!");
    print ("%s\n%s\n", e, rot47 (e));
}
