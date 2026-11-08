string rail_fence (string s, int rails) {
    var rows = new string[rails];
    for (int i = 0; i < rails; i++) rows[i] = "";
    int r = 0, dir = 1;
    for (int i = 0; i < s.length; i++) {
        rows[r] += s.substring (i, 1);
        if (r == 0) dir = 1;
        if (r == rails - 1) dir = -1;
        r += dir;
    }
    return string.joinv ("", rows);
}

void main () {
    print ("%s\n", rail_fence ("WEAREDISCOVERED", 3));
}
