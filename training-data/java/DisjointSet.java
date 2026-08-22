import java.util.HashMap;
import java.util.Map;

public class DisjointSet<T> {
    private final Map<T, T> parent = new HashMap<>();
    private final Map<T, Integer> size = new HashMap<>();

    public DisjointSet(Iterable<T> elements) {
        for (T e : elements) {
            parent.put(e, e);
            size.put(e, 1);
        }
    }

    public T find(T x) {
        while (!parent.get(x).equals(x)) {
            parent.put(x, parent.get(parent.get(x)));
            x = parent.get(x);
        }
        return x;
    }

    public void union(T a, T b) {
        T rootA = find(a);
        T rootB = find(b);
        if (rootA.equals(rootB)) return;
        if (size.get(rootA) < size.get(rootB)) {
            T tmp = rootA;
            rootA = rootB;
            rootB = tmp;
        }
        parent.put(rootB, rootA);
        size.put(rootA, size.get(rootA) + size.get(rootB));
    }

    public boolean connected(T a, T b) {
        return find(a).equals(find(b));
    }

    public static void main(String[] args) {
        DisjointSet<String> ds = new DisjointSet<>(java.util.List.of("a", "b", "c", "d"));
        ds.union("a", "b");
        ds.union("b", "c");
        System.out.println(ds.connected("a", "c") + " " + ds.connected("a", "d"));
    }
}
