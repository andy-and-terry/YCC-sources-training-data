import std.stdio;

// Greedy sequence whose pairwise sums are all distinct.
void main() {
    int[] seq;
    bool[int] sums;
    for (int cand = 1; seq.length < 8; cand++) {
        bool[int] fresh;
        bool ok = true;
        foreach (x; seq ~ cand) {
            int s = x + cand;
            if (s in sums || s in fresh) { ok = false; break; }
            fresh[s] = true;
        }
        if (ok) {
            seq ~= cand;
            foreach (s; fresh.byKey) sums[s] = true;
        }
    }
    foreach (v; seq) write(v, " ");
    writeln();
}
