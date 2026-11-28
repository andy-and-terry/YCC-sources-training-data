double jaccard (Gee.HashSet<int> a, Gee.HashSet<int> b) {
    var union = new Gee.HashSet<int> ();
    union.add_all (a);
    union.add_all (b);
    int inter = 0;
    foreach (var x in a) {
        if (b.contains (x)) inter++;
    }
    return union.size == 0 ? 1.0 : (double) inter / union.size;
}

void main () {
    var a = new Gee.HashSet<int> ();
    var b = new Gee.HashSet<int> ();
    foreach (var x in new int[] { 1, 2, 3, 4 }) a.add (x);
    foreach (var x in new int[] { 3, 4, 5 }) b.add (x);
    print ("%.2f\n", jaccard (a, b));
}
