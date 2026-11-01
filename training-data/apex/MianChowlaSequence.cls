public class MianChowlaSequence {
    // Greedy sequence whose pairwise sums are all distinct.
    public static String firstEight() {
        List<Integer> seq = new List<Integer>();
        Set<Integer> sums = new Set<Integer>();
        Integer cand = 1;
        while (seq.size() < 8) {
            Set<Integer> fresh = new Set<Integer>();
            Boolean ok = true;
            List<Integer> all = seq.clone();
            all.add(cand);
            for (Integer x : all) {
                Integer s = x + cand;
                if (sums.contains(s) || fresh.contains(s)) {
                    ok = false;
                    break;
                }
                fresh.add(s);
            }
            if (ok) {
                seq.add(cand);
                sums.addAll(fresh);
            }
            cand++;
        }
        List<String> parts = new List<String>();
        for (Integer v : seq) parts.add(String.valueOf(v));
        return String.join(parts, ' ');
    }
}
