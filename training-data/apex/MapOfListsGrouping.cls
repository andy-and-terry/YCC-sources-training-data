public class MapOfListsGrouping {
    public static Map<Integer, List<String>> groupByLength(List<String> words) {
        Map<Integer, List<String>> result = new Map<Integer, List<String>>();
        for (String w : words) {
            Integer key = w.length();
            if (!result.containsKey(key)) {
                result.put(key, new List<String>());
            }
            result.get(key).add(w);
        }
        return result;
    }

    public static void main() {
        Map<Integer, List<String>> groups = groupByLength(
            new List<String>{ 'a', 'bb', 'cc', 'ddd', 'e' });
        for (Integer k : new List<Integer>(groups.keySet())) {
            System.debug(k + ' -> ' + groups.get(k));
        }
    }
}
