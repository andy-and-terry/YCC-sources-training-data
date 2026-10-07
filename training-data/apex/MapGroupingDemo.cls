public class MapGroupingDemo {
    // Group a list of strings by their first letter.
    public static Map<String, List<String>> groupByInitial(List<String> words) {
        Map<String, List<String>> groups = new Map<String, List<String>>();
        for (String w : words) {
            String key = w.substring(0, 1).toUpperCase();
            if (!groups.containsKey(key)) {
                groups.put(key, new List<String>());
            }
            groups.get(key).add(w);
        }
        return groups;
    }

    public static void run() {
        Map<String, List<String>> g =
            groupByInitial(new List<String>{'apple', 'avocado', 'banana', 'blueberry', 'cherry'});
        List<String> keys = new List<String>(g.keySet());
        keys.sort();
        for (String k : keys) {
            System.debug(k + ' -> ' + g.get(k));
        }
    }
}
