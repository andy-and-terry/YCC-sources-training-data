import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.Map;

public class LfuCache<K, V> {
    private final int capacity;
    private final Map<K, V> values = new HashMap<>();
    private final Map<K, Integer> freq = new HashMap<>();
    private final Map<Integer, LinkedHashSet<K>> freqGroups = new HashMap<>();
    private int minFreq = 0;

    public LfuCache(int capacity) {
        this.capacity = capacity;
    }

    private void bump(K key) {
        int f = freq.get(key);
        freqGroups.get(f).remove(key);
        if (freqGroups.get(f).isEmpty() && minFreq == f) minFreq++;
        freq.put(key, f + 1);
        freqGroups.computeIfAbsent(f + 1, x -> new LinkedHashSet<>()).add(key);
    }

    public V get(K key) {
        if (!values.containsKey(key)) return null;
        bump(key);
        return values.get(key);
    }

    public void put(K key, V value) {
        if (capacity <= 0) return;
        if (values.containsKey(key)) {
            values.put(key, value);
            bump(key);
            return;
        }
        if (values.size() >= capacity) {
            K evictKey = freqGroups.get(minFreq).iterator().next();
            freqGroups.get(minFreq).remove(evictKey);
            values.remove(evictKey);
            freq.remove(evictKey);
        }
        values.put(key, value);
        freq.put(key, 1);
        freqGroups.computeIfAbsent(1, x -> new LinkedHashSet<>()).add(key);
        minFreq = 1;
    }

    public static void main(String[] args) {
        LfuCache<String, Integer> cache = new LfuCache<>(2);
        cache.put("a", 1);
        cache.put("b", 2);
        cache.get("a");
        cache.put("c", 3);
        System.out.println(cache.get("b") + " " + cache.get("a") + " " + cache.get("c"));
    }
}
