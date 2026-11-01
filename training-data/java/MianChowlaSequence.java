import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

// Greedy sequence whose pairwise sums are all distinct.
public class MianChowlaSequence {
    public static void main(String[] args) {
        List<Integer> seq = new ArrayList<>();
        Set<Integer> sums = new HashSet<>();
        for (int cand = 1; seq.size() < 8; cand++) {
            Set<Integer> fresh = new HashSet<>();
            boolean ok = true;
            List<Integer> all = new ArrayList<>(seq);
            all.add(cand);
            for (int x : all) {
                int s = x + cand;
                if (sums.contains(s) || !fresh.add(s)) { ok = false; break; }
            }
            if (ok) { seq.add(cand); sums.addAll(fresh); }
        }
        System.out.println(seq);
    }
}
