int pieces (int cuts) {
    return (cuts * cuts + cuts + 2) / 2;
}

void main () {
    for (int n = 0; n < 10; n++) print ("%d ", pieces (n));
    print ("\n"); // 1 2 4 7 11 16 22 29 37 46
}
