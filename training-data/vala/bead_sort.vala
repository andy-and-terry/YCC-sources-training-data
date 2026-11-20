// Bead (gravity) sort.
int[] bead_sort (int[] nums) {
    int max = 0;
    foreach (int n in nums) if (n > max) max = n;
    var cols = new int[max];
    foreach (int n in nums) for (int i = 0; i < n; i++) cols[i]++;
    var rows = new int[nums.length];
    for (int r = 0; r < nums.length; r++) {
        int c = 0;
        foreach (int v in cols) if (v > r) c++;
        rows[nums.length - 1 - r] = c;
    }
    return rows;
}

void main () {
    foreach (int v in bead_sort ({ 5, 3, 1, 4, 2 })) print ("%d ", v);
    print ("\n");
}
