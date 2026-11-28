using Gee;
int[,] insert_interval (int[,] iv, int nlo, int nhi) {
    var out = new ArrayList<int[]> ();
    int lo = nlo, hi = nhi, i = 0, n = iv.length[0];
    while (i < n && iv[i, 1] < lo) { out.add ({ iv[i, 0], iv[i, 1] }); i++; }
    while (i < n && iv[i, 0] <= hi) {
        lo = int.min (lo, iv[i, 0]);
        hi = int.max (hi, iv[i, 1]);
        i++;
    }
    out.add ({ lo, hi });
    while (i < n) { out.add ({ iv[i, 0], iv[i, 1] }); i++; }
    var result = new int[out.size, 2];
    for (int k = 0; k < out.size; k++) { result[k, 0] = out[k][0]; result[k, 1] = out[k][1]; }
    return result;
}

void main () {
    var r = insert_interval ({ { 1, 3 }, { 6, 9 } }, 2, 5);
    for (int i = 0; i < r.length[0]; i++) print ("[%d,%d] ", r[i, 0], r[i, 1]);
    print ("\n"); // [1,5] [6,9]
}
