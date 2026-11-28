public class JaccardSimilarity {
    public static Decimal jaccard(Set<Integer> a, Set<Integer> b) {
        Set<Integer> inter = a.clone();
        inter.retainAll(b);
        Set<Integer> uni = a.clone();
        uni.addAll(b);
        return uni.isEmpty() ? 1.0 : Decimal.valueOf(inter.size()) / uni.size();
    }

    public static void demo() {
        System.debug(jaccard(new Set<Integer>{1, 2, 3, 4}, new Set<Integer>{3, 4, 5}));
    }
}
