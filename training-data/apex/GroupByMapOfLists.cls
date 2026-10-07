public class GroupByMapOfLists {
    public static Map<Integer, List<String>> groupByLength(List<String> words) {
        Map<Integer, List<String>> groups = new Map<Integer, List<String>>();
        for (String w : words) {
            Integer len = w.length();
            if (!groups.containsKey(len)) {
                groups.put(len, new List<String>());
            }
            groups.get(len).add(w);
        }
        return groups;
    }

    public static void main() {
        List<String> words = new List<String>{'apex', 'code', 'cat', 'dog', 'trigger', 'soql', 'run'};
        Map<Integer, List<String>> groups = groupByLength(words);
        List<Integer> keys = new List<Integer>(groups.keySet());
        keys.sort();
        for (Integer k : keys) {
            System.debug(k + ': ' + groups.get(k));
        }
    }
}
