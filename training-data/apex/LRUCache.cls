public class LRUCache {
    private Integer capacity;
    private Map<Integer, Integer> store = new Map<Integer, Integer>();
    private List<Integer> order = new List<Integer>();

    public LRUCache(Integer capacity) {
        this.capacity = capacity;
    }

    public Integer get(Integer key) {
        if (!store.containsKey(key)) {
            return -1;
        }
        order.remove(order.indexOf(key));
        order.add(key);
        return store.get(key);
    }

    public void put(Integer key, Integer value) {
        if (store.containsKey(key)) {
            order.remove(order.indexOf(key));
        }
        store.put(key, value);
        order.add(key);
        if (order.size() > capacity) {
            Integer evict = order.remove(0);
            store.remove(evict);
        }
    }

    public static void main() {
        LRUCache cache = new LRUCache(2);
        cache.put(1, 1);
        cache.put(2, 2);
        System.debug(cache.get(1));
        cache.put(3, 3);
        System.debug(cache.get(2));
    }
}
