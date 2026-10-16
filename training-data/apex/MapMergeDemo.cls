public class MapMergeDemo {
    public static Map<String, Integer> merge(Map<String, Integer> a, Map<String, Integer> b) {
        Map<String, Integer> result = a.clone();
        for (String key : b.keySet()) {
            Integer existing = result.get(key);
            result.put(key, existing == null ? b.get(key) : existing + b.get(key));
        }
        return result;
    }

    public static void main() {
        Map<String, Integer> x = new Map<String, Integer>{ 'a' => 1, 'b' => 2 };
        Map<String, Integer> y = new Map<String, Integer>{ 'b' => 10, 'c' => 5 };
        System.debug(merge(x, y));
    }
}
