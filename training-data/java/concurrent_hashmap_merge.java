import java.util.concurrent.ConcurrentHashMap;

public class ConcurrentHashMapMerge {
    public static void main(String[] args) {
        ConcurrentHashMap<String, Integer> m = new ConcurrentHashMap<>();
        for (String w : "a b a c a b".split(" "))
            m.merge(w, 1, Integer::sum);
        System.out.println(new java.util.TreeMap<>(m));
    }
}
