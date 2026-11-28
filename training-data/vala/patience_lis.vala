void main () {
    int[] a = { 10, 9, 2, 5, 3, 7, 101, 18 };
    var tails = new Gee.ArrayList<int> ();
    foreach (int x in a) {
        int lo = 0, hi = tails.size;
        while (lo < hi) {
            int mid = (lo + hi) / 2;
            if (tails[mid] < x) lo = mid + 1; else hi = mid;
        }
        if (lo == tails.size) tails.add (x); else tails[lo] = x;
    }
    print ("%d\n", tails.size);
}
