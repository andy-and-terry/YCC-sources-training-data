using GLib;
int four_sum_count (int[] a, int[] b, int[] c, int[] d) {
    var sums = new HashTable<int, int> (direct_hash, direct_equal);
    foreach (int x in a)
        foreach (int y in b)
            sums.insert (x + y, sums.contains (x + y) ? sums.lookup (x + y) + 1 : 1);
    int count = 0;
    foreach (int x in c)
        foreach (int y in d)
            if (sums.contains (-(x + y))) count += sums.lookup (-(x + y));
    return count;
}

void main () {
    print ("%d\n", four_sum_count ({ 1, 2 }, { -2, -1 }, { -1, 2 }, { 0, 2 })); // 2
}
