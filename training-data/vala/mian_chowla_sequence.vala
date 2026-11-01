// Greedy sequence whose pairwise sums are all distinct.
void main () {
    var seq = new Gee.ArrayList<int> ();
    var sums = new Gee.HashSet<int> ();
    int cand = 1;
    while (seq.size < 8) {
        var fresh = new Gee.HashSet<int> ();
        bool ok = true;
        var all = new Gee.ArrayList<int> ();
        all.add_all (seq);
        all.add (cand);
        foreach (int x in all) {
            int s = x + cand;
            if (sums.contains (s) || !fresh.add (s)) {
                ok = false;
                break;
            }
        }
        if (ok) {
            seq.add (cand);
            sums.add_all (fresh);
        }
        cand++;
    }
    foreach (int v in seq) print ("%d ", v);
    print ("\n");
}
