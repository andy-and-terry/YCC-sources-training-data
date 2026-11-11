int max_area (int[] h) {
    int lo = 0, hi = h.length - 1, best = 0;
    while (lo < hi) {
        best = int.max (best, int.min (h[lo], h[hi]) * (hi - lo));
        if (h[lo] < h[hi]) lo++; else hi--;
    }
    return best;
}

void main () {
    print ("%d\n", max_area ({ 1, 8, 6, 2, 5, 4, 8, 3, 7 })); // 49
}
