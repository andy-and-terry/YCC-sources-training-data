public class LFUCache {
    private Integer capacity;
    private Map<Integer, Integer> values = new Map<Integer, Integer>();
    private Map<Integer, Integer> frequencies = new Map<Integer, Integer>();

    public LFUCache(Integer capacity) {
        this.capacity = capacity;
    }

    public Integer get(Integer key) {
        if (!values.containsKey(key)) {
            return -1;
        }
        frequencies.put(key, frequencies.get(key) + 1);
        return values.get(key);
    }

    public void put(Integer key, Integer value) {
        if (capacity <= 0) {
            return;
        }
        if (values.containsKey(key)) {
            values.put(key, value);
            frequencies.put(key, frequencies.get(key) + 1);
            return;
        }
        if (values.size() >= capacity) {
            Integer evictKey = null;
            Integer lowestFreq = null;
            for (Integer k : frequencies.keySet()) {
                if (lowestFreq == null || frequencies.get(k) < lowestFreq) {
                    lowestFreq = frequencies.get(k);
                    evictKey = k;
                }
            }
            if (evictKey != null) {
                values.remove(evictKey);
                frequencies.remove(evictKey);
            }
        }
        values.put(key, value);
        frequencies.put(key, 1);
    }

    public static void main() {
        LFUCache cache = new LFUCache(2);
        cache.put(1, 1);
        cache.put(2, 2);
        System.debug(cache.get(1));
        cache.put(3, 3);
        System.debug(cache.get(2));
        System.debug(cache.get(3));
    }
}
