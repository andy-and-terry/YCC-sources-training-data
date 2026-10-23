public class UlamNumbers {
    // After 1 and 2, each term is the smallest number that is a sum of
    // two distinct earlier terms in exactly one way
    public static List<Integer> ulam(Integer count) {
        List<Integer> terms = new List<Integer>{ 1, 2 };
        Integer cand = 2;
        while (terms.size() < count) {
            cand++;
            Integer ways = 0;
            for (Integer a = 0; a < terms.size(); a++) {
                for (Integer b = a + 1; b < terms.size(); b++) {
                    if (terms[a] + terms[b] == cand) {
                        ways++;
                    }
                }
            }
            if (ways == 1) {
                terms.add(cand);
            }
        }
        return terms;
    }

    public static void main() {
        System.debug(ulam(15));
    }
}
