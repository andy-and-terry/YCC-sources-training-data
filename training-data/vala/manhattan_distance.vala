// Manhattan distance of two vectors.
int manhattan (int[] a, int[] b) {
    int s = 0;
    for (int i = 0; i < a.length; i++) s += (a[i] - b[i]).abs ();
    return s;
}

void main () {
    print ("%d\n", manhattan ({ 1, 2 }, { 4, 6 }));
}
