void hanoi (int n, string a, string b, string c, Gee.ArrayList<string> out) {
    if (n == 0) return;
    hanoi (n - 1, a, c, b, out);
    out.add (a + "->" + c);
    hanoi (n - 1, b, a, c, out);
}

void main () {
    var moves = new Gee.ArrayList<string> ();
    hanoi (3, "A", "B", "C", moves);
    print ("%d moves\n", moves.size);
}
