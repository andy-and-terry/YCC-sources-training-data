public class RecamanSequence {
    // a(n) = a(n-1) - n if that is positive and unseen, otherwise a(n-1) + n
    public static List<Integer> recaman(Integer count) {
        List<Integer> terms = new List<Integer>{ 0 };
        Set<Integer> seen = new Set<Integer>{ 0 };
        Integer cur = 0;
        for (Integer i = 1; i < count; i++) {
            Integer next = cur - i;
            if (next < 0 || seen.contains(next)) {
                next = cur + i;
            }
            seen.add(next);
            terms.add(next);
            cur = next;
        }
        return terms;
    }

    public static void main() {
        System.debug(recaman(20));
    }
}
