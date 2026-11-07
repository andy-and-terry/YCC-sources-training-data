int[] plus_one (int[] digits) {
    var d = digits;
    for (int i = d.length - 1; i >= 0; i--) {
        if (d[i] < 9) { d[i]++; return d; }
        d[i] = 0;
    }
    var grown = new int[d.length + 1];
    grown[0] = 1;
    return grown;
}

void main () {
    foreach (int x in plus_one ({ 1, 2, 9 })) print ("%d", x);
    print ("\n"); // 130
    foreach (int x in plus_one ({ 9, 9 })) print ("%d", x);
    print ("\n"); // 100
}
