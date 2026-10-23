public class KolakoskiSequence {
    // Self-describing sequence of 1s and 2s: its own terms are the lengths of its runs
    public static List<Integer> kolakoski(Integer count) {
        List<Integer> seq = new List<Integer>{ 1, 2, 2 };
        Integer i = 2; // index of the term giving the next run length
        while (seq.size() < count) {
            Integer symbol = Math.mod(i, 2) == 0 ? 1 : 2;
            for (Integer j = 0; j < seq[i]; j++) {
                seq.add(symbol);
            }
            i++;
        }
        List<Integer> result = new List<Integer>();
        for (Integer k = 0; k < count; k++) {
            result.add(seq[k]);
        }
        return result;
    }

    public static void main() {
        System.debug(kolakoski(20));
    }
}
