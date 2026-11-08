int[] encode (int[] xs) {
    int[] d = new int[xs.length];
    d[0] = xs[0];
    for (int i = 1; i < xs.length; i++) d[i] = xs[i] - xs[i - 1];
    return d;
}

void main () {
    foreach (int v in encode ({ 10, 12, 15, 15, 20 })) print ("%d ", v);
    print ("\n");
}
