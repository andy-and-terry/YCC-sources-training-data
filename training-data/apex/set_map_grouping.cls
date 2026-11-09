public class SetMapGrouping {
    public static Map<String, List<String>> groupByFirstLetter(List<String> words) {
        Map<String, List<String>> groups = new Map<String, List<String>>();
        for (String w : words) {
            String k = w.substring(0, 1).toUpperCase();
            if (!groups.containsKey(k)) groups.put(k, new List<String>());
            groups.get(k).add(w);
        }
        return groups;
    }
}
