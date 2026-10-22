public class KolakoskiSequence {
    // Kolakoski over {1, 2}: the run lengths of the sequence describe itself
    public static List<Integer> kolakoski(Integer count) {
        List<Integer> terms = new List<Integer>{ 1, 2, 2 };
        Integer idx = 2;
        while (terms.size() < count) {
            Integer sym = 3 - terms[terms.size() - 1];
            for (Integer k = 0; k < terms[idx]; k++) {
                terms.add(sym);
            }
            idx++;
        }
        List<Integer> result = new List<Integer>();
        for (Integer i = 0; i < count; i++) {
            result.add(terms[i]);
        }
        return result;
    }

    public static void main() {
        System.debug(String.join(kolakoski(20), ' '));
    }
}
