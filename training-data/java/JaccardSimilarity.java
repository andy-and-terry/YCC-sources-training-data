import java.util.HashSet;
import java.util.Set;

public class JaccardSimilarity {
    static <T> double jaccard(Set<T> a, Set<T> b) {
        Set<T> inter = new HashSet<>(a);
        inter.retainAll(b);
        Set<T> union = new HashSet<>(a);
        union.addAll(b);
        return union.isEmpty() ? 1.0 : (double) inter.size() / union.size();
    }

    public static void main(String[] args) {
        System.out.println(jaccard(Set.of(1, 2, 3, 4), Set.of(3, 4, 5)));
    }
}
